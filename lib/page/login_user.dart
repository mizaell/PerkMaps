import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../screens/home_screen.dart';
import 'cadastro.dart';

class UsuarioLogin extends StatefulWidget {
  @override
  _UsuarioLoginState createState() => _UsuarioLoginState();
}

class _UsuarioLoginState extends State<UsuarioLogin> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> getUsuario(text) async {
    final docs = await Firestore.instance.collection('usuarios').getDocuments();
    if (text == docs.documents.where((element) => element.data['email']))
      return true;
    else
      return false;
  }

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Login',
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
                    color: Color.fromARGB(239, 0, 153, 107),
                  ),
                );

              return Form(
                key: _formKey,
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: 20, left: 12, right: 12, bottom: 15),
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                        height: 95,
                        child: Image.asset('images/logoif.png'),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                          ),
                          child: Text(
                            "Instituto Federal de Educação, \nCiência e Tecnologia do Ceará",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(239, 0, 153, 107),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          "Entre com seu E-mail e senha!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff726F6F),
                          ),
                        ),
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
                              getUsuario(text) == true)
                            return "E-mail inválido";
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
                              setState(
                                () {
                                  _showPassword = !_showPassword;
                                },
                              );
                            },
                          ),
                        ),
                        obscureText: _showPassword == false ? true : false,
                        style: TextStyle(fontSize: 20),
                        validator: (text) {
                          if (text.isEmpty || text.length < 6)
                            return "A senha deve conter pelo menos 6 dígitos";
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            if (_emailController.text.isEmpty ||
                                !_emailController.text.contains("@") ||
                                !EmailValidator.validate(_emailController.text))
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Insira seu email para recuperar sua conta!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            else {
                              model.recoverPass(_emailController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Confira a caixa de entrada/span do seu email!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(239, 0, 153, 107),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Esqueci minha senha",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(239, 0, 153, 107),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 40,
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
                                ),
                              ),
                              SizedBox(
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
                                    if (_formKey.currentState.validate()) {
                                      model.signIn(
                                          email: _emailController.text,
                                          pass: _passController.text,
                                          onSuccess: _onSuccess,
                                          onFail: _onFail);
                                    }
                                  },
                                  child: const Text(
                                    "Entrar",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            "Ou se não tiver uma conta",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff726F6F),
                            ),
                          ),
                        ),
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
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 25,
                                          right: 25,
                                          bottom: 2,
                                          top: 2),
                                      primary: Colors.white,
                                      textStyle: const TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 25,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Cadastro(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Cadastre-se",
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
            },
          ),
        ),
      );

  void _onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Login realizado com Sucesso!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: Color.fromARGB(239, 0, 153, 107),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 1)).then(
      (_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
    );
  }

  void _onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Falha ao entrar, email ou senha inválido",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
