import 'dart:async';

class MyTimer {
  static Timer startTimer({
    required int milliseconds,
    required Function onFinished,
  }) =>
      Timer(Duration(milliseconds: milliseconds), () => onFinished());
}
