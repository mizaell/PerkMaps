import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:perk_maps/page/login_user.dart';
import 'package:perk_maps/page/novo_artigo.dart';
import 'package:perk_maps/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

import '../screens/home_screen.dart';

class NavigationDrawerWidget extends StatefulWidget {
  final PageController pageController;

  NavigationDrawerWidget(this.pageController);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  // final padding = EdgeInsets.symmetric(horizontal: 30);
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(239, 0, 153, 107),
            Color.fromARGB(236, 2, 255, 179),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        );
    return Drawer(
        child: ScopedModel<UserModel>(
            model: UserModel(),
            child: ScopedModelDescendant<UserModel>(
                builder: (context, child, model) {
              return Stack(
                children: <Widget>[
                  _buildDrawerBack(),
                  ListView(
                    padding: EdgeInsets.only(top: 16.0),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(28.0, 16.0, 16.0, 8.0),
                        height: 150.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 16.0,
                              left: 0.0,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset('images/logoPerkMapsSplash.png'),
                              ),
                            ),
                            Positioned(
                              top: 16.0,
                              left: 45.0,
                              child: Text(
                                "PerkMaps",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                                left: 0.0,
                                bottom: 0.0,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Olá${!model.isLoggedIn() ? "" : ", " + model.userData['name']}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.0,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      GestureDetector(
                                        child: Row(children: <Widget>[
                                          Text(
                                            !model.isLoggedIn()
                                                ? "Entre ou Cadastre-se"
                                                : "Sair",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 7, 61, 34),
                                              fontSize: 22.0,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          !model.isLoggedIn()
                                              ? Icon(
                                                  Icons.input_sharp,
                                                  color: Color.fromARGB(
                                                      255, 7, 61, 34),
                                                )
                                              : Icon(
                                                  Icons.output_sharp,
                                                  color: Color.fromARGB(
                                                      255, 7, 61, 34),
                                                ),
                                        ]),
                                        onTap: () {
                                          if (!model.isLoggedIn())
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UsuarioLogin()));
                                          else
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          model.signOut();
                                        },
                                      ),
                                    ])),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      new SizedBox(
                        height: 2.0,
                        child: new Center(
                          child: new Container(
                            margin: new EdgeInsetsDirectional.only(
                                start: 15.0, end: 15.0),
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DrawerTile(
                          Icons.home, "Início", widget.pageController, 0),
                      if (model.isLoggedIn())
                        DrawerTile(Icons.view_list_rounded, "Meus Artigos",
                            widget.pageController, 1),
                      if (model.isLoggedIn() && model.userData['adm'] == true)
                        DrawerTile(Icons.event_available_rounded,
                            "Avaliar Artigos", widget.pageController, 2),
                      if (model.isLoggedIn())
                        DrawerTile(Icons.settings, "Configurações",
                            widget.pageController, 3),
                    ],
                  ),
                ],
              );
            })));
  }
}
//
