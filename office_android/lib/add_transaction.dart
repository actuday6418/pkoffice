import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:office_android/camera.dart';
import 'package:office_android/view_image.dart';
import 'package:office_android/globals.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);
  @override
  State<Transaction> createState() => TransactionState();
}

class TransactionState extends State<Transaction> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    showImage = image.isInitialised;
    return Container(
        color: primaryBackground,
        child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                            color: secondaryContrast))),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Title',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Amount',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      focusColor: accent,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryContrast,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: accent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Description',
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: TextButton(
                        onPressed: () async {
                          // Obtain a list of the available cameras on the device.
                          final cameras = await availableCameras();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            WidgetsFlutterBinding.ensureInitialized();

// Get a specific camera from the list of available cameras.
                            final camera = cameras.first;
                            return TakePictureScreen(camera: camera);
                          })).then((_) => setState(() {}));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.25))
                              ],
                              color: secondaryBackground,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Add/Update reciept",
                                    style:
                                        TextStyle(color: primaryContrast)))))),
                Visibility(
                    maintainState: true,
                    visible: showImage,
                    child: Padding(
                        padding: EdgeInsets.only(top: 15, left: 50, right: 50),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.25))
                              ],
                              color: secondaryBackground,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextButton(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: primaryContrast,
                                    ),
                                    Text(" View reciept",
                                        style:
                                            TextStyle(color: primaryContrast)),
                                  ]),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Photo();
                                }));
                              },
                            )))),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            decoration: BoxDecoration(
                              color: secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.25))
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Submit",
                                    style:
                                        TextStyle(color: primaryContrast))))))
              ],
            )));
  }
}
