import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:perk_maps/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _pass2Controller = TextEditingController();
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
      appBar: AppBar(
        title: Text(
          'Cadastro',
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
                    //     Center(
                    //       child: Text(
                    //         "Cadastro",
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           fontSize: 35,
                    //           color: Color.fromARGB(239, 0, 153, 107),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //   height: 30,
                    // ),
                    Container(
                      child: Text(
                        "Preencha todos os dados para realizar seu cadastro e poder inserir artigos ao nosso mapa!",
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
                      controller: _nameController,
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
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Nome Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _lastnameController,
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
                        labelText: "Sobrenome",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Sobrenome Inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _instituicaoController,
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
                        labelText: "Instituição",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Instituição inválida";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _atuacaoController,
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
                        labelText: "Área de atuação",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Area de atuação inválida";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _vinculoController,
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
                        labelText: "Vínculo com a instituição",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Vínculo com a instituição inválido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
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
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty ||
                            !text.contains("@") ||
                            getUsuario(text) == true) return "E-mail inválido";
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passController,
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
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _showPassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          )),
                      obscureText: _showPassword == false ? true : false,
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "A senha deve conter pelo menos 6 dígitos";
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _pass2Controller,
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
                        labelText: "Confirmação de Senha",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPasswordConfirm == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              _showPasswordConfirm = !_showPasswordConfirm;
                            });
                          },
                        ),
                      ),
                      obscureText: _showPasswordConfirm == false ? true : false,
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty ||
                            text.length < 6 ||
                            _pass2Controller.text != _passController.text)
                          return "Confirmação de senha inválida";
                        else
                          return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15),
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
                                      Map<String, dynamic> userData = {
                                        'name': _nameController.text,
                                        'lastname': _lastnameController.text,
                                        'email': _emailController.text,
                                        'instituicao':
                                            _instituicaoController.text,
                                        'vinculoComInstituicao':
                                            _vinculoController.text,
                                        'areaAtuacao': _atuacaoController.text
                                      };
                                      model.signUp(
                                        userData: userData,
                                        pass: _passController.text,
                                        onSuccess: _onSuccess,
                                        onFail: _onFail,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Cadastrar",
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Cadastro realizado com sucesso!"),
      backgroundColor: Color.fromARGB(239, 0, 153, 107),
      duration: Duration(seconds: 3),
    ));
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Falha ao cadastrar, Email já cadastrado!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 4),
    ));
  }
}
