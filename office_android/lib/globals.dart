import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraImage {
  late XFile image;
  bool isInitialised = false;
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

var primaryBackground = HexColor.fromHex("#F58787");
var primaryContrast = HexColor.fromHex("#663838");
var secondaryBackground = HexColor.fromHex("#FFDBBA");
var secondaryContrast = HexColor.fromHex("5E5145");
var accent = HexColor.fromHex("#D93030");
CameraImage image = CameraImage();
