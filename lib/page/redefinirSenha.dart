import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:perk_maps/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class RedefinirSenha extends StatefulWidget {
  @override
  _RedefinirSenhaState createState() => _RedefinirSenhaState();
}

class _RedefinirSenhaState extends State<RedefinirSenha> {
  final _passController = TextEditingController();
  final _passNewController = TextEditingController();
  final _passNew2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKeyNewPass = GlobalKey<FormState>();
  final _formKeyNewPass2 = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showPassword = false;
  bool _newShowPassword = false;
  bool _newShowPasswordConfirm = false;
  
  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Redefinir Senha',
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
                        "Insira sua senha atual e a nova senha",
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
                          labelText: "Senha Atual",
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
                          return "Sua senha atual deve conter pelo menos 6 dígitos";
                        else
                          return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      key: _formKeyNewPass,
                      controller: _passNewController,
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
                          labelText: "Nova Senha",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _newShowPassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              setState(() {
                                _newShowPassword = !_newShowPassword;
                              });
                            },
                          )),
                      obscureText: _newShowPassword == false ? true : false,
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "A nova senha deve conter pelo menos 6 dígitos";
                        else
                          return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      key: _formKeyNewPass2,
                      controller: _passNew2Controller,
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
                        labelText: "Confirmação de Nova Senha",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _newShowPasswordConfirm == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              _newShowPasswordConfirm =
                                  !_newShowPasswordConfirm;
                            });
                          },
                        ),
                      ),
                      obscureText:
                          _newShowPasswordConfirm == false ? true : false,
                      style: TextStyle(fontSize: 20),
                      validator: (text) {
                        if ((text.isEmpty || text.length < 6) ||
                            _passNew2Controller.text != _passNewController.text)
                          return "Confirmação de nova senha inválida";
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
                                      AuthCredential credential =
                                          EmailAuthProvider.getCredential(
                                              email: model.firebaseUser.email,
                                              password: _passController.text);
                                      model.firebaseUser
                                          .reauthenticateWithCredential(
                                              credential)
                                          .then((value) {
                                        model.firebaseUser
                                            .updatePassword(
                                                _passNewController.text)
                                            .then((value) => _onSuccess())
                                            .catchError((e) => _onFail());
                                      }).catchError((e) => _onFail());
                                    }
                                  },
                                  child: const Text(
                                    "Atualizar",
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
      content: Text(
        "Senha atualizada com Sucesso!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      backgroundColor: Color.fromARGB(239, 0, 153, 107),
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 1)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    });
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Falha ao atualizar senha, senha atual inválida.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
