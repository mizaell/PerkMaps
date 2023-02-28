

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/page/informar_incosistencias.dart';
import 'package:url_launcher/url_launcher.dart';

class ValidarArtigo extends StatefulWidget {
  final DocumentSnapshot snapshot;

  ValidarArtigo(this.snapshot);

  @override
  State<ValidarArtigo> createState() => _ValidarArtigoState();
}

class _ValidarArtigoState extends State<ValidarArtigo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _launchLink(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //                         const SnackBar(
      //                             content: Text('Erro ao buscar Endereço')));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("DOI não encontrada"),
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
            'Avaliar Artigo',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(239, 0, 153, 107),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.only(
                top: 20,
                left: 12,
                right: 12,
                bottom: 15,
              ),
              children: <Widget>[
                // Center(
                //   child: Text(
                //     "Detalhes do Artigo",
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
                    "Analise atentamente cada dado do artigo antes de avaliar.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff726F6F),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                    widget.snapshot.data['especie'],
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
                    widget.snapshot.data["hospedeiro"],
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
                    widget.snapshot.data["localColeta"],
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
                    widget.snapshot.data["origem"],
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
                    widget.snapshot.data["muinicipio"],
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
                    widget.snapshot.data["estado"],
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
                        grau(widget.snapshot.data['point'].latitude.toString()) +
                        "°" +
                        minuto(widget.snapshot.data['point'].latitude.toString()) +
                        "'" +
                        segundo(widget.snapshot.data['point'].latitude.toString()) +
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
                        grau(widget.snapshot.data['point'].longitude.toString()) +
                        "°" +
                        minuto(widget.snapshot.data['point'].longitude.toString()) +
                        "'" +
                        segundo(
                            widget.snapshot.data['point'].longitude.toString()) +
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
                    "Referências:",
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
                    widget.snapshot.data["referencia"],
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
                            _launchLink(Uri.parse(widget.snapshot.data["doi"])),
                        child: Text(
                          widget.snapshot.data["doi"],
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 0, 0, 255),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(241, 205, 0, 48),
                                      Color.fromARGB(239, 248, 56, 101),
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 40,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.only(left: 25, right: 25),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    widget.snapshot.reference
                                        .updateData({'status': "Recusado"});
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "O artigo foi recusado com sucesso. Obrigado pela sua avaliação!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 18,
                                        ),
                                      ),
                                      backgroundColor: Color(0xff2E90038),
                                      duration: Duration(seconds: 5),
                                    ));
                                    Future.delayed(Duration(seconds: 5))
                                        .then((_) {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Text(
                                    "Recusar",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(240, 12, 185, 201),
                                      Color.fromARGB(237, 2, 225, 245),
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 40,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.only(left: 25, right: 25),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    // Firestore.instance.collection('artigos').document(snapshot.documentID).updateData('inconsistencia': )
                                     widget.snapshot.reference
                                    .updateData({'status': "Inconsistente"});
                                      Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          InformarInconsistencias(
                                              this.widget.snapshot),
                                              
                                    ));
                                  },
                                  child: const Text(
                                    "Inconsistente",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(239, 0, 153, 107),
                                      Color.fromARGB(235, 2, 205, 144),
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 40,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.only(left: 25, right: 25),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    widget.snapshot.reference
                                        .updateData({'status': "Aprovado"});
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "O artigo foi aprovado com sucesso e já pode ser visualizado no mapa. Obrigado pela sua avaliação!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(239, 0, 153, 107),
                                      duration: Duration(seconds: 5),
                                    ));
                                    Future.delayed(Duration(seconds: 5))
                                        .then((_) {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Text(
                                    "Aprovar",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}


