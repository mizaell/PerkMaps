import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExibirArtigo extends StatefulWidget {
  final DocumentSnapshot docs;

  ExibirArtigo(this.docs);

  @override
  State<ExibirArtigo> createState() => _ExibirArtigoState();
}

class _ExibirArtigoState extends State<ExibirArtigo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _launchLink(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "DOI não encontrada",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 3),
      ));
    }
  }

  String grau(String lat) {
    var grau;
    if (lat[0] == '-') grau = double.parse(lat.split('.')[0]) * -1;
    //if (double.parse(grau) < 10) grau = "0" + lat[1];
    return grau.toString().split('.')[0];
  }

  String minuto(String min) {
    double minuto;
    if (min[0] == '-')
      minuto =
          ((double.parse(min) * -1) - (double.parse(min.split('.')[0]) * -1)) *
              60;
    min = minuto.toString();
    return min.split('.')[0];
  }

  String segundo(String seg) {
    double segundo;
    var aux;
    if (seg[0] == '-')
      segundo = (((double.parse(seg) * -1) - double.parse(seg[1])) * 60);
    aux = double.parse(segundo.toString().split('.')[0]);
    segundo -= aux;
    segundo *= 60;
    seg = segundo.toString();

    return seg.split('.')[0];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Detalhes do Artigo',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(239, 0, 153, 107),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding:
                  EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 15),
              children: <Widget>[
                // Center(
                //   child: Text(
                //     "Detalhes do Artigo",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 35,
                //       color: Color.fromARGB(239, 0, 153, 107),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                Container(
                  child: Text(
                    "Espécie: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.docs.data['especie'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Hospedeiro: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.docs.data['hospedeiro'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Local de Coleta: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.docs.data['localColeta'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Origem: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.docs.data['origem'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Município: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.docs.data['muinicipio'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Estado: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.docs.data['estado'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Georreferenciamento: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Latitude: " +
                        grau(widget.docs.data['point'].latitude.toString()) +
                        "º" +
                        minuto(widget.docs.data['point'].latitude.toString()) +
                        "'" +
                        segundo(widget.docs.data['point'].latitude.toString()) +
                        '" S',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Longitude: " +
                        grau(widget.docs.data['point'].longitude.toString()) +
                        "º" +
                        minuto(widget.docs.data['point'].longitude.toString()) +
                        "'" +
                        segundo(
                            widget.docs.data['point'].longitude.toString()) +
                        '" W',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Referências: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.docs.data['referencia'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "DOI: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(239, 0, 153, 107),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () =>
                            _launchLink(Uri.parse(widget.docs.data["doi"])),
                        child: Text(
                          widget.docs.data["doi"],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 0, 0, 255),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
}
