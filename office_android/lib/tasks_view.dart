import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:office_android/add_transaction.dart';
import 'package:office_android/globals.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);
  @override
  State<Tasks> createState() => TasksState();
}

class Entry {
  final String title;
  final String description;
  final List<String> flairs;
  var isDone = false;

  Entry(this.title, this.description, this.flairs);
}

class TasksState extends State<Tasks> {
  final entries = [
    Entry("Biscuit", "Big Parle G for Arun. Ten big ones.", ["Round", "nice"]),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        ["Round", "nice"]),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        ["Round", "nice"]),
    Entry(
        "Goat",
        "1 goat for making 1 chicken biriyani for one person :/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        ["Round", "nice", "long", "okdoeidoeikdoe", "imdekjnel"]),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        ["Round", "nice"]),
    Entry(
        "Big pathram",
        "1 pathram for 1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        ["Round", "nice"]),
    Entry(
        "Biriyani",
        "1 chicken biriyani for one person/ Came with hard boilied egg and fried onions. Tasted okay. Not phenomenal.",
        ["Round", "nice"]),
  ];

  List<Widget> flairsBuilder(List<String> flairs) {
    List<Widget> list = [];
    for (var flair in flairs) {
      list.add(Padding(
        padding: EdgeInsets.only(right: 10, top: 10, bottom: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: accent,
            boxShadow: [
              BoxShadow(blurRadius: 5.0, color: Color.fromRGBO(0, 0, 0, 0.25))
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
              child: Text(flair,
                  style: TextStyle(color: secondaryBackground, fontSize: 12)),
              padding: EdgeInsets.all(5)),
        ),
      ));
    }
    return list;
  }

  List<Widget> tasksBuilder() {
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
                  children: <Widget>[
                    Row(children: [
                      if (entry.isDone)
                        Padding(
                            child: Icon(Icons.check, color: Colors.green),
                            padding: EdgeInsets.only(right: 10)),
                      Text(entry.title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: primaryContrast,
                          ))
                    ]),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: flairsBuilder(entry.flairs))),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(entry.description,
                            style: TextStyle(
                                color: primaryContrast, fontSize: 17))),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: !entry.isDone
                            ? TextButton(
                                onPressed: () {
                                  entry.isDone = true;
                                  setState(() {});
                                },
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 8.0,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.25))
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Mark as done",
                                            style: TextStyle(
                                                color: primaryContrast,
                                                fontSize: 17)))))
                            : TextButton(
                                onPressed: () {
                                  entry.isDone = false;
                                  setState(() {});
                                },
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 8.0,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.25))
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text("Mark as to do",
                                            style: TextStyle(
                                                color: primaryContrast,
                                                fontSize: 17))))))
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
      child: SingleChildScrollView(
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
                          child: Text("Tasks",
                              style: TextStyle(
                                color: secondaryContrast,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              )))),
                ] +
                tasksBuilder()),
      ),
    );
  }
}
