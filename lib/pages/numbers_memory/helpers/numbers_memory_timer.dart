import 'dart:async';


class NumbersMemoryTimer {
  static startTimer({required int milliseconds, required Function onFinished}){
    Future.delayed(
      Duration(milliseconds: milliseconds),
      () => onFinished(),
    );
  }
}