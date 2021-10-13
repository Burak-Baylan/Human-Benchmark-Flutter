import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Phone {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double heigth(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static closeStatusBar() => SystemChrome.setEnabledSystemUIOverlays([]);

  static openStatusBar() =>
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}
