import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:perk_maps/page/novo_artigo.dart';
import 'package:perk_maps/page/validar.dart';
import 'package:scoped_model/scoped_model.dart';

class Administrador extends StatefulWidget {
  @override
  State<Administrador> createState() => _AdministradorState();
}

class _AdministradorState extends State<Administrador> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            color: Color.fromARGB(31, 131, 131, 131),
            child: ListView(
              padding:
                  EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 15),
              children: <Widget>[
                // Center(
                //   child: Text(
                //     "Administrador",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontFamily: 'Arial',
                //       fontSize: 35,
                //       color: Color.fromARGB(239, 0, 153, 107),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 25,
                // ),
                Row(
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Artigos Atribuídos",
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color.fromARGB(239, 0, 153, 107),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    239, 0, 153, 107))))),
                                onPressed: () async {
                                  await Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => NovoArtigo()));
                                  setState(() {});
                                },
                                child: const Icon(Icons.add,
                                    color: Color.fromARGB(239, 0, 153, 107)),
                                // Text(
                                //   "Novo Artigo",
                                //   textAlign: TextAlign.right,
                                //   style: TextStyle(
                                //     fontFamily: 'RobotoMono',
                                //     color: Color.fromARGB(239, 0, 153, 107),
                                //     fontSize: 16,
                                //   ),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(children: [
                  Container(
                      // padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ScopedModel<UserModel>(
                          model: UserModel(),
                          child: ScopedModelDescendant<UserModel>(
                              builder: (context, child, model) {
                            return FutureBuilder<QuerySnapshot>(
                              future: Firestore.instance
                                  .collection('artigos')
                                  .getDocuments(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    // child: Text(
                                    //   "Ainda não existem artigos para serem avaliados.",
                                    //   textAlign: TextAlign.center,
                                    //   style: TextStyle(
                                    //     fontSize: 20,
                                    //     color: Color(0xff726F6F),
                                    //   ),
                                    // ),
                                    child: CircularProgressIndicator(
                                        color:
                                            Color.fromARGB(239, 0, 153, 107)),
                                  )
                                  ;
                                } else {
                                  return Column(
                                    children:
                                        snapshot.data.documents.map((doc) {
                                      return artigosAtribuidos(doc);
                                    }).toList(),
                                  );
                                }
                              },
                            );
                          }))),
                ]),
              ],
            ),
          ),
        ),
      );

  Widget artigosAtribuidos(DocumentSnapshot doc) {
    if (doc.data['status'] == 'Atribuído')
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffD8F6DB),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 2),
                  alignment: Alignment.topLeft,
                  child: Text(
                    doc.data["status"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: Color(0xff0726F6F),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    doc.data["titulo"],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2, bottom: 2),
                  alignment: Alignment.bottomRight,
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
                          width: 70,
                          height: 30,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(
                                  top: 2, bottom: 2, left: 2, right: 2),
                              primary: Colors.white,
                              textStyle: const TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () async {
                              await Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => ValidarArtigo(doc),
                              ));
                              setState(() {});
                            },
                            child: const Text(
                              "Avaliar",
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
        ]),
      );
    else
      return Container();
  }
}
