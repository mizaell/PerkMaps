import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../page/exibir_artigo.dart';

class Home extends StatelessWidget {
  //flutter build apk --split-per-abi
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 35, 115, 57),
            Color.fromARGB(255, 255, 255, 255),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );
    return Container(
      child: Stack(
        children: <Widget>[
          _buildBodyBack(),
          MapScreen(),
        ],
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markes = [];

  Future<void> getArtigos() async {
    final docs = await Firestore.instance.collection('artigos').getDocuments();

    markes =
        docs.documents.where((e) => e.data['status'] == "Aprovado").map((data) {
      final point = data["point"] as GeoPoint;

      return Marker(
          markerId: MarkerId(data.documentID),
          position: LatLng(point.latitude, point.longitude),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ExibirArtigo(data),
            ));
          });
    }).toList();

    print(docs);
    setState(() {});
  }

  @override
  void initState() {
    getArtigos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-3.738639, -40.989416),
          zoom: 4,
        ),
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        mapType: MapType.hybrid,
        markers: markes.toSet(),
      ),
    );
  }
}
