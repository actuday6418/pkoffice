import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:office_android/globals.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => HomeState();
}

class Pair {
  final String a;
  final String b;

  Pair(this.a, this.b);
}

class HomeState extends State<Home> {
  final notificationsData = [
    Pair("Gar", "dedjie deidjeoi djoej doej doei jdoej doeijoeij 2p 2p"),
    Pair("Wkjlk",
        "dwiuh poipo ipowei poq wqpw qbnwqnmbw mnbw qkhw  qkjhwqkjhwqkhkwhqkhwkqhkwhqkhwq"),
    Pair("Gar", "dedjie deidjeoi djoej doej doei jdoej doeijoeij 2p 2p"),
    Pair("Gar", "dedjie deidjeoi djoej doej doei jdoej doeijoeij 2p 2p"),
    Pair("Wkjlk",
        "dwiuh poipo ipowei poq wqpw qbnwqnmbw mnbw qkhw  qkjhwqkjhwqkhkwhqkhwkqhkwhqkhwq"),
    Pair("Gar", "dedjie deidjeoi djoej doej doei jdoej doeijoeij 2p 2p"),
  ];

  final verse =
      "Have I not commanded you? Be strong and courageous. Do not be frightened, and do not be dismayed, for the LORD your God is with you wherever you go.";
  final verseAddress = "Joshua 1:9";

  List<Widget> verseBuilder() {
    List<Widget> list = [];
    list.add(Column(children: [
      Padding(
          padding: EdgeInsets.only(left: 15, top: 70),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Today\'s",
                  style: TextStyle(
                    color: secondaryContrast,
                    fontSize: 30,
                  )))),
      Padding(
          padding: EdgeInsets.only(left: 15),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Verse",
                  style: TextStyle(
                    color: secondaryContrast,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  )))),
    ]));
    list.add(Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: secondaryBackground,
            boxShadow: [
              BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0.25))
            ],
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: 25, right: 15, left: 15),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: primaryBackground,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8.0,
                            color: Color.fromRGBO(0, 0, 0, 0.25))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(verseAddress,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: secondaryContrast,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(verse,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryContrast,
                    fontSize: 17,
                  )),
            )
          ]),
        ),
      ),
    ));
    return list;
  }

  List<Widget> notificationsBuilder() {
    List<Widget> list = [];
    for (var entry in notificationsData) {
      list.add(Center(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 15, right: 15),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: secondaryBackground,
              boxShadow: [
                BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0.25))
              ],
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(entry.a,
                        style: TextStyle(
                            color: primaryContrast,
                            fontSize: 30,
                            fontWeight: FontWeight.bold))),
                Text(entry.b,
                    style: TextStyle(color: primaryContrast, fontSize: 17)),
              ]),
            ),
          ),
        ),
      ));
    }
    list.add(SizedBox(
      height: 100,
    ));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        minHeight: 200,
        maxHeight: MediaQuery.of(context).size.height,
        parallaxEnabled: true,
        backdropEnabled: true,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: primaryBackground,
        panel: Column(children: [
          Padding(
              child: Icon(Icons.keyboard_arrow_up, color: secondaryContrast),
              padding: EdgeInsets.only(top: 20)),
          Padding(
              padding: EdgeInsets.only(left: 15, top: 40),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("General",
                      style: TextStyle(
                        color: secondaryContrast,
                        fontSize: 30,
                      )))),
          Padding(
              padding: EdgeInsets.only(left: 15, bottom: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Notifications",
                      style: TextStyle(
                        color: secondaryContrast,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      )))),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: notificationsBuilder()),
          ))
        ]),
        body: Container(
            color: primaryBackground,
            child: Column(
              children: verseBuilder(),
            )));
  }
}
