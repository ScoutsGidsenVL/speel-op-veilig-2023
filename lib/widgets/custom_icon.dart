import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  static final types = {
    "vuur": const IconData(code: "\u0031"),
    "water": const IconData(code: "\u0032"),
    "hoogte": const IconData(code: "\u0033"),
    "materiaal": const IconData(code: "\u0034"),
    "verkeer": const IconData(code: "\u0035"),
    "drugs-tabak-en-alcohol": const IconData(code: "\u0036"),
    "welzijn": const IconData(code: "\u0037"),
    "wet": const IconData(code: "\u0038", color: Color(0xFFed1c23)),
    "regel": const IconData(code: "\u0039", color: Color(0xFFf5821f)),
    "richtlijn": const IconData(code: "\u0061", color: Color(0xFF256f91)),
    "suggestie": const IconData(code: "\u0062", color: Color(0xFF748d26)),
  };

  final String type;
  final bool? color;
  final double? size;

  const CustomIcon({Key? key, required this.type, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = types[type];
    return data == null
        ? Container()
        : Text(data.code,
            style: TextStyle(
                fontFamily: 'SpeelOpVeilig',
                fontSize: size ?? 14,
                color: ((color ?? false) ? data.color : null) ??
                    Theme.of(context).colorScheme.primary));
  }
}

class IconData {
  const IconData({required this.code, this.color});

  final String code;
  final Color? color;
}
