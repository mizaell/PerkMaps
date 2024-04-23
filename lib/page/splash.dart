import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perk_maps/models/user_model.dart';
import 'package:perk_maps/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 6, right: 6, bottom: 15),
        color: Colors.white,
        child: ListView(children: <Widget>[
          Container(
            width: 60,
            height: 110,
            child: Image.asset('images/logoif.png'),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 2,
              ),
              child: Text(
                "Instituto Federal de Educação, Ciência \ne Tecnologia do Ceará",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(239, 0, 153, 107),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                "PerkMaps",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(239, 0, 153, 107),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 2,
              ),
              child: Text(
                "Perkinsus sp. em bivalves \n na costa brasileira",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(239, 0, 153, 107),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    // Padding(padding: EdgeInsets.only(bottom: 30),),
                    Container(
                      child: Image.asset('images/estuario.png'),
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 11.0,
                          color: Color.fromARGB(255, 7, 61, 34),
                          fontFamily: 'Arial',
                        ),
                        children: <TextSpan>[
                          //new TextSpan(text: 'Foto 01: ', style:
                          //new TextStyle(fontWeight: FontWeight.bold, )),
                          new TextSpan(
                            text: 'Estuário Rio Pacotí',
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    Container(
                      child: Image.asset('images/ostra.png'),
                    ),

                    RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 11.0,
                          color: Color.fromARGB(255, 7, 61, 34),
                          fontFamily: 'Arial',
                        ),
                        children: <TextSpan>[
                          //  new TextSpan(text: 'Foto 02: ', style:
                          //  new TextStyle(fontWeight: FontWeight.bold)),
                          new TextSpan(
                            text: 'Ostra',
                          ),
                          new TextSpan(
                            text: ' Crassostrea ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          new TextSpan(
                            text: 'rhizophorae',
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 90),
                        child: Image.asset('images/perkinsusSp.png'),
                      ),

                      RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 11.0,
                            color: Color.fromARGB(255, 7, 61, 34),
                            fontFamily: 'Arial',
                          ),
                          children: <TextSpan>[
                            //  new TextSpan(text: 'Foto 03: ', style:
                            //  new TextStyle(fontWeight: FontWeight.bold)),
                            new TextSpan(
                              text: 'Hipnósporo de Perkinsus',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Stack(
        children: [
          new Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              height: 50.0,
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                children: [
                  // SizedBox(
                  //   width: 55,
                  //   height: 55,
                  //   child: Image.asset('images/logoPerkMapsSplash.png'),
                  // ),
                  Text(
                    "Laboratório de Patologia de Organismos Aquáticos - LABPOA",
                    textAlign: TextAlign.center,
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
  }
}
