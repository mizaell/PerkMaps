import 'package:flutter_config/flutter_config.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:perk_maps/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(new MyApp());
}
//https://pt.stackoverflow.com/questions/547691/o-que-devo-fazer-para-fazer-upload-de-arquivo-com-s%C3%ADmbolos-de-depura%C3%A7%C3%A3o-no-flutt
//Mobile application for android developed in flutter, using firebase as a database, and the GoogleMaps API. Developed in the TCC project, the main purpose is to map and track appearances of the attack of a protozoan (Perkinsus sp.) on oysters on the Brazilian coast.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
          title: "PerkMaps", 
          theme: ThemeData(
            fontFamily: 'Arial',
            primarySwatch: Colors.green,
            primaryColor: Color.fromARGB(236, 2, 255, 179),
          ),
          debugShowCheckedModeBanner: false,
          home: Splash()),
    );
  }
}
