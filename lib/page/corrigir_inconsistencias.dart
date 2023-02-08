import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CorrigirInconsistenciasState extends StatefulWidget {
  final DocumentSnapshot snapshot;

  CorrigirInconsistenciasState(this.snapshot);

  @override
  State<CorrigirInconsistenciasState> createState() =>
      _CorrigirInconsistenciasStateState();
}

class _CorrigirInconsistenciasStateState
    extends State<CorrigirInconsistenciasState> {
  final _especieController = TextEditingController();
  final _hospedeiroController = TextEditingController();
  final _localColetaController = TextEditingController();
  final _origemController = TextEditingController();
  final _municipioController = TextEditingController();
  final _estadoController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _tituloController = TextEditingController();
  final _referenciaController = TextEditingController();
  final _doiController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => null;

  String transformarCoordenadas(String lat) {
    if (lat.contains('°')) {
      String grau = lat.split('°')[0];
      String aux = lat.split("°")[1];
      if (lat.contains("'")) {
        String min = aux.split("'")[0];
        String aux2 = aux.split("'")[1];
        if (lat.contains('"')) {
          String seg = aux2.split('"')[0];

          lat = (-1 *
                  (double.parse(grau) +
                      (double.parse(min) + (double.parse(seg) / 60)) / 60))
              .toStringAsFixed(6);
        }
      }
    } else {
      lat = (-1 * double.parse(lat)).toString();
    }
    return lat;
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
          'Corrigir Artigo',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(239, 0, 153, 107),
      ),
      body: ScopedModel<UserModel>(
          model: UserModel(),
          child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(
                    color: Color.fromARGB(239, 0, 153, 107)),
              );

            return Form(
              key: _formKey,
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
                    Container(
                      child: Text(
                        "Os avaliadores apontaram as seguintes inconsistências em seu artigo:",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff726F6F),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      //width: 170,
                      height: 100,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffD8F6DB),
                      ),
                      child: ListView(
                        padding: EdgeInsets.only(
                          top: 5,
                          bottom: 7,
                        ),
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              widget.snapshot.data["inconsistencia"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        "Faça as alterações necessárias e reenvie seu artigo!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(239, 0, 153, 107),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _especieController,
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
                        hintText: widget.snapshot.data["especie"],
                        labelText: "Espécie",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        //prefixText: snapshot.data["especie"],
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Espécie Inválida";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _hospedeiroController,
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
                        hintText: widget.snapshot.data["hospedeiro"],
                        labelText: "Hospedeiro",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Hospedeiro Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _localColetaController,
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
                        hintText: widget.snapshot.data["localColeta"],
                        labelText: "Local de Coleta",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Local de Coleta Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _origemController,
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
                        hintText: widget.snapshot.data["origem"],
                        labelText: "Origem",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Origem Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _municipioController,
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
                        hintText: widget.snapshot.data["muinicipio"],
                        labelText: "Município",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Município Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _estadoController,
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
                        hintText: widget.snapshot.data["estado"],
                        labelText: "Estado",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Estado Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //height: 180,
                      padding: EdgeInsets.only(bottom: 8, top: 8, left: 8, right: 8),
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(0xffD8F6DB),
                              blurRadius: 15.0,
                              offset: Offset(0.0, 0.15))
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        // padding: EdgeInsets.only(
                        //   top: 5,
                        //   bottom: 7,
                        // ),
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Georreferenciamento",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _latitudeController,
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
                              hintText: grau(widget
                                      .snapshot.data['point'].latitude
                                      .toString()) +
                                  "º" +
                                  minuto(widget.snapshot.data['point'].latitude
                                      .toString()) +
                                  "'" +
                                  segundo(widget.snapshot.data['point'].latitude
                                      .toString()) +
                                  '"',
                              labelText: "Latitude (ex: 3°49'8\")",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            validator: (text) {
                              if (text.isEmpty ||
                                  !_latitudeController.text.contains("°") ||
                                  !_latitudeController.text.contains("'") ||
                                  !_latitudeController.text.contains('"')) {
                                return "Latitude deve ter o formato acima, grau, minuto e segundo";
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _longitudeController,
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
                              hintText: grau(widget
                                      .snapshot.data['point'].longitude
                                      .toString()) +
                                  "º" +
                                  minuto(widget.snapshot.data['point'].longitude
                                      .toString()) +
                                  "'" +
                                  segundo(widget
                                      .snapshot.data['point'].longitude
                                      .toString()) +
                                  '"',
                              labelText: "Longitude (ex: 38°25'10\")",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            validator: (text) {
                              if (text.isEmpty ||
                                  !_longitudeController.text.contains("°") ||
                                  !_longitudeController.text.contains("'") ||
                                  !_longitudeController.text.contains('"')) {
                                return "Longitude deve ter o formato acima, grau, minuto e segundo";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _tituloController,
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
                        hintText: widget.snapshot.data["titulo"],
                        labelText: "Título",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Título Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _referenciaController,
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
                        hintText: widget.snapshot.data["referencia"],
                        labelText: "Referências",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Referências Inválidas";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _doiController,
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
                        hintText: widget.snapshot.data["doi"],
                        labelText: "DOI",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "DOI Inválida";
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 15,
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
                                    padding:
                                        EdgeInsets.only(left: 25, right: 25, bottom: 2, top: 2),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      Map<String, dynamic> artigoData = {
                                        'especie': _especieController.text,
                                        'hospedeiro':
                                            _hospedeiroController.text,
                                        'localColeta':
                                            _localColetaController.text,
                                        'origem': _origemController.text,
                                        'muinicipio': _municipioController.text,
                                        'estado': _estadoController.text,
                                        'point': GeoPoint(
                                            double.parse(transformarCoordenadas(
                                                _latitudeController.text)),
                                            double.parse(transformarCoordenadas(
                                                _longitudeController.text))),
                                        'titulo': _tituloController.text,
                                        'referencia':
                                            _referenciaController.text,
                                        'doi': _doiController.text,
                                        'status': "Atribuído",
                                      };
                                      model.upArtigoData(
                                        artigoData: artigoData,
                                        id: widget.snapshot.documentID,
                                        onSuccess: _onSuccess,
                                        onFail: _onFail,
                                      );
                                      Future.delayed(Duration(seconds: 5))
                                          .then((_) {
                                        Navigator.of(context).pop();
                                      });
                                      // Navigator.of(context).pushReplacement(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ArtigoSalvo()));
                                    }
                                  },
                                  child: const Text(
                                    "Reenviar",
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
            );
          })));

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Suas alterações foram atribuídas com sucesso e seu artigo será submetido a uma nova avaliação.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      backgroundColor: Color.fromARGB(239, 0, 153, 107),
      duration: Duration(seconds: 5),
    ));
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Falha ao corrigir o artigo!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 4),
    ));
  }
}
