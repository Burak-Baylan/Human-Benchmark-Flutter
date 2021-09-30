import 'dart:async';

import 'package:flutter/material.dart';

class NumbersMemoryTimer {
  static startTimer({required int milliseconds, required Function onFinished}) async {
    Future.delayed(
      Duration(milliseconds: milliseconds),
      () => onFinished(),
    );
  }
}
