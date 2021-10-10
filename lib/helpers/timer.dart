import 'dart:async';

class Timer{

  static startTimer({
    required int milliseconds,
    required Function onFinished,
  }) {
    Future.delayed(
      Duration(milliseconds: milliseconds),
      () => onFinished(),
    );
  }
}