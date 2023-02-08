
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/page/validar.dart';
import 'package:url_launcher/url_launcher.dart';


class InformarInconsistencias extends StatefulWidget {
  final DocumentSnapshot snapshot;

  InformarInconsistencias(this.snapshot);

  @override
  State<InformarInconsistencias> createState() => _InformarInconsistenciasState();
}

class _InformarInconsistenciasState extends State<InformarInconsistencias> {
  final _inconsistenciaController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  Future<void> _launchLink(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
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

        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () async {
          //                     await Navigator.of(context)
          //                         .pushReplacement(MaterialPageRoute(
          //                       builder: (context) => ValidarArtigo(widget.snapshot),
          //                     ));
          //                     setState(() {});
          //                   },
          //   icon: Icon(Icons.arrow_back),
          // ),
          title: Text(
            'Inconsistências',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(239, 0, 153, 107),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white12,
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
                //     "Inconsistências",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 35,
                //       color: Color.fromARGB(239, 0, 153, 107),
                //     ),
                //   ),
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
                Container(
                  child: Text(
                    "Informe as inconsistências que impediram o artigo de ser inserido no mapa.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff726F6F),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                   
                    controller: _inconsistenciaController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Color(0xffD8F6DB),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      labelText: "Inconsistências",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                    validator: (text) {
                          if (text.isEmpty)
                            return "Inconsistência não pode ser vazia";
                        },
                  ),
                
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
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
                                padding: EdgeInsets.only(
                                    left: 25, right: 25, bottom: 2, top: 2),
                                primary: Colors.white,
                                textStyle: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              onPressed: () {
                                if(_formKey.currentState.validate()){
                                 Firestore.instance
                                    .collection('artigos')
                                    .document(widget.snapshot.documentID)
                                    .updateData({
                                  "inconsistencia":
                                      _inconsistenciaController.text,
                                
                                });
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                    "O autor do artigo será informado sobre as  inconsistências existentes. Obrigado pela sua avaliação!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(240, 12, 185, 201),
                                  duration: Duration(seconds: 5),
                                ));
                                Future.delayed(Duration(seconds: 5)).then((_) {
                                  Navigator.of(context).pop();
                                });}
                              },
                              child: const Text(
                                "Enviar",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
