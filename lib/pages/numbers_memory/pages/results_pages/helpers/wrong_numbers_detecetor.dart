import 'package:flutter/material.dart';

class WrongDetecetor {
  WrongDetecetor({required this.answer, required this.userAnswer});

  late int answerLength;
  late int userAnswerLength;
  late String answer;
  late String userAnswer;
  List<String> answerCharacters = [];
  List<String> userAnswerCharacters = [];
  List<Text> textSpanList = [];
  List<Text> extraTextSpanList = [];
  String extraText = "";
  String text = "";

  initializeValues() {
    answerLength = answer.length;
    userAnswerLength = userAnswer.length;
    answerCharacters.clear();
    userAnswerCharacters.clear();
    textSpanList.clear();
  }

  Row detect() {
    initializeValues();
    _seperate();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: textSpanList + extraTextSpanList,
    );
  }

  _seperate() {
    _seperateCharacters(charList: answerCharacters, text: answer);
    _seperateCharacters(charList: userAnswerCharacters, text: userAnswer);
    _compareLenghts();
  }

  _seperateCharacters({
    required List<String> charList,
    required String text,
  }) {
    int textLength = text.length;
    for (var i = 0; i < textLength; i++) {
      String char = text[i];
      charList.add(char);
    }
  }

  _compareLenghts() {
    int endPoint;
    if (answerLength > userAnswerLength) {
      endPoint = userAnswerLength - 1;
    } else {
      endPoint = answerLength - 1;
      extraText = userAnswer.substring(answerLength, userAnswerLength);
      extraTextSpanList.add(
        mText(text: extraText, lineThrough: true),
      );
    }
    _strikeOut(endPoint: endPoint);
  }

  _strikeOut({required endPoint}) {
    for (var i = 0; i <= endPoint; i++) {
      String answer = answerCharacters[i];
      String userAnswer = userAnswerCharacters[i];
      if (answer != userAnswer) {
        textSpanList.add(
          mText(text: userAnswer, lineThrough: true),
        );
      } else {
        textSpanList.add(
          mText(text: userAnswer, lineThrough: false),
        );
      }
    }
  }

  mText({
    required String text,
    required bool lineThrough,
  }) {
    return Text(
      text,
      style: TextStyle(
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        color: Colors.white,
        fontFamily: null,
        fontSize: 14,
      ),
    );
  }
}
