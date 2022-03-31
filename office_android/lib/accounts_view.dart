import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:office_android/add_transaction.dart';
import 'package:office_android/globals.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);
  @override
  State<Accounts> createState() => AccountsState();
}

class Entry {
  final String title;
  final String description;
  final int amount;

  Entry(this.title, this.description, this.amount);
}

class AccountsState extends State<Accounts> {
  final entries = [
    Entry("Biscuit", "Big Parle G for Arun. Ten big ones.", 20),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        200),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        200),
    Entry(
        "Goat",
        "1 goat for making 1 chicken biriyani for one person :/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        2000000),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        200),
    Entry(
        "Big pathram",
        "1 pathram for 1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        200),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        200),
  ];

  List<Widget> accountsBuilder() {
    List<Widget> list = [];
    list.add(SizedBox(
      height: 50,
    ));
    for (var entry in entries) {
      list.add(Padding(
          padding: EdgeInsets.all(15),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: secondaryBackground,
              boxShadow: [
                BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0.25))
              ],
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(entry.title,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primaryContrast,
                            )),
                        Text("₹ " + entry.amount.toString(),
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 16)),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(entry.description,
                            style: TextStyle(
                                color: primaryContrast, fontSize: 17))),
                  ],
                )),
          )));
    }
    list.add(SizedBox(
      height: 50,
    ));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryBackground,
        child: Stack(children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 15, top: 60),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Your",
                                  style: TextStyle(
                                    color: secondaryContrast,
                                    fontSize: 30,
                                  )))),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Transactions",
                                  style: TextStyle(
                                    color: secondaryContrast,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  )))),
                    ] +
                    accountsBuilder()),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 35, right: 20),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      image.isInitialised = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transaction()));
                    },
                    child: Icon(Icons.add),
                    backgroundColor: accent,
                  )))
        ]));
  }
}
