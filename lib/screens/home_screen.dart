import 'package:flutter/material.dart';
import 'package:perk_maps/page/area_adm.dart';
import 'package:perk_maps/page/area_user.dart';
import 'package:perk_maps/page/cadastro.dart';
import 'package:perk_maps/page/configuracao.dart';
import 'package:perk_maps/tabs/home.dart';
import '';
import 'package:perk_maps/widget/navigation_drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
      return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text('PerkMaps', style: TextStyle(fontSize: 30),),
            centerTitle: true,
            backgroundColor: Color.fromARGB(239, 0, 153, 107),
          ),
          body: Home(),
          drawer: NavigationDrawerWidget(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Área do Usuário", style: TextStyle(fontSize: 30, fontFamily: 'Arial'),),
            centerTitle: true,
            backgroundColor: Color.fromARGB(239, 0, 153, 107),
            //backgroundColor: Color(0xf0428772),
          ),
          drawer: NavigationDrawerWidget(_pageController),
          body: Usuario(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Área do Avaliador", style: TextStyle(fontSize: 30),),
            centerTitle: true,
            backgroundColor: Color.fromARGB(239, 0, 153, 107),
          ),
          body: Administrador(),
          drawer: NavigationDrawerWidget(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Configurações", style: TextStyle(fontSize: 30),),
            centerTitle: true,
            backgroundColor: Color.fromARGB(239, 0, 153, 107),
          ),
          body: Configuracoes(),
          drawer: NavigationDrawerWidget(_pageController),
        ),
      ],
    );
  }
}
