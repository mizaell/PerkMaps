import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:perk_maps/page/cadastro.dart';
import 'package:perk_maps/page/login_user.dart';
import 'package:perk_maps/page/redefinirSenha.dart';
import 'package:perk_maps/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _instituicaoController = TextEditingController();
  final _vinculoController = TextEditingController();
  final _atuacaoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showPassword = false;
  bool _showPasswordConfirm = false;

  Future<void> getUsuario(text) async {
    final docs = await Firestore.instance.collection('usuarios').getDocuments();
    if (text == docs.documents.where((element) => element.data['email']))
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      body: ScopedModel<UserModel>(
          model: UserModel(),
          child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
            return new Scaffold(
              body: Center(
                child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                        top: 25, left: 20, right: 20, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 20,
                          child: Text(
                            "Nome\n",
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 61, 34),
                              fontSize: 18.0,
                              fontFamily: 'Arial',
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          //padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "${!model.isLoggedIn() ? "" : model.userData['name']} ${model.userData['lastname']}",
                            style: TextStyle(
                                color: Color.fromARGB(239, 0, 153, 107),
                                fontSize: 22.0,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        new SizedBox(
                          height: 2.0,
                          child: new Center(
                            child: new Container(
                              height: 1.5,
                              color: Color.fromARGB(239, 0, 153, 107),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 20,
                          child: Text(
                            "E-mail\n",
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 61, 34),
                              fontSize: 18.0,
                              fontFamily: 'Arial',
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${!model.isLoggedIn() ? "" : model.userData['email']} ",
                            style: TextStyle(
                                color: Color.fromARGB(239, 0, 153, 107),
                                fontSize: 22.0,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        new SizedBox(
                          height: 2.0,
                          child: new Center(
                            child: new Container(
                              height: 1.5,
                              color: Color.fromARGB(239, 0, 153, 107),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 20,
                          child: Text(
                            "Instituição\n",
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 61, 34),
                              fontSize: 18.0,
                              fontFamily: 'Arial',
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${!model.isLoggedIn() ? "" : model.userData['instituicao']} ",
                            style: TextStyle(
                                color: Color.fromARGB(239, 0, 153, 107),
                                fontSize: 22.0,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        new SizedBox(
                          height: 2.0,
                          child: new Center(
                            child: new Container(
                              height: 1.5,
                              color: Color.fromARGB(239, 0, 153, 107),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 20,
                          child: Text(
                            "Área de Atuação\n",
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 61, 34),
                              fontSize: 18.0,
                              fontFamily: 'Arial',
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${!model.isLoggedIn() ? "" : model.userData['areaAtuacao']} ",
                            style: TextStyle(
                                color: Color.fromARGB(239, 0, 153, 107),
                                fontSize: 22.0,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        new SizedBox(
                          height: 2.0,
                          child: new Center(
                            child: new Container(
                              height: 1.5,
                              color: Color.fromARGB(239, 0, 153, 107),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 20,
                          child: Text(
                            "Vínculo com a Instituição\n",
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 61, 34),
                              fontSize: 18.0,
                              fontFamily: 'Arial',
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${!model.isLoggedIn() ? "" : model.userData['vinculoComInstituicao']} ",
                            style: TextStyle(
                                color: Color.fromARGB(239, 0, 153, 107),
                                fontSize: 22.0,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        new SizedBox(
                          height: 2.0,
                          child: new Center(
                            child: new Container(
                              height: 1.5,
                              color: Color.fromARGB(239, 0, 153, 107),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(),
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
                                    )),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            left: 25, right: 25, bottom: 2, top: 2),
                                        primary: Colors.white,
                                        textStyle: const TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 25,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              RedefinirSenha(),
                                        ));
                                      },
                                      child: const Text(
                                        "Atualizar Senha",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 10),
                        // Container(
                        //   height: 20,
                        //   child: Text(
                        //     "Segurança\n",
                        //     style: TextStyle(
                        //       color: Color.fromARGB(255, 7, 61, 34),
                        //       fontSize: 18.0,
                        //       fontFamily: 'Arial',
                        //       //fontWeight: FontWeight.bold
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   child: Text(
                        //     "Redefinir Senha",
                        //     style: TextStyle(
                        //         color: Color.fromARGB(239, 0, 153, 107),
                        //         fontSize: 22.0,
                        //         fontFamily: 'Arial',
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        // SizedBox(height: 15),
                        // new SizedBox(
                        //   height: 2.0,
                        //   child: new Center(
                        //     child: new Container(
                        //       height: 2,
                        //       color: Color.fromARGB(239, 0, 153, 107),
                        //     ),
                        //   ),
                        // ),
                      ],
                    )),
              ),
              bottomNavigationBar: Stack(
                children: [
                  new Container(
                      height: 90.0,
                      alignment: Alignment.center,
                      //color: Colors.amber,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 55,
                            height: 55,
                            child: Image.asset('images/logoPerkMapsSplash.png'),
                          ),
                          Text(
                            "PerkMaps",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 7, 61, 34),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            );
          })));
}
