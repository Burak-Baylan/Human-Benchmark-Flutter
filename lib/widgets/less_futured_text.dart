import 'package:flutter/material.dart';

class LessText {
  static lessFuturedText({
    required String text,
    Color color = Colors.grey,
    double fontSize = 20,
    String? fontFamily = 'GemunuLibre',
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
