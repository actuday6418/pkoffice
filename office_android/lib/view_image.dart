import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:office_android/globals.dart';

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);
  @override
  State<Photo> createState() => PhotoState();
}

class PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
      imageProvider: Image.file(File(image.image.path)).image,
    ));
  }
}
