import 'dart:async';

class MyTimer {
  static Timer startTimer({
    required int milliseconds,
    required Function onFinished,
  }) {
    return Timer(Duration(milliseconds: milliseconds), () => onFinished());
  }
}
