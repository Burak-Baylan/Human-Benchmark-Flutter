import 'package:flutter/material.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';

class WrongDetecetor {
  late NumbersMemoryController c;
  late String number;
  late String userAnswer;
  String text = "";

  List<String> numberCharacters = [];
  List<String> userAnswerCharacters = [];

  String extraText = "";

  List<Text> textSpanList = [];
  List<Text> extraTextSpanList = [];

  late int numberLength;
  late int userAnswerLength;

  initializeValues() {
    number = c.valueController.number;
    userAnswer = c.valueController.usersAnswer;
    numberLength = number.length;
    userAnswerLength = userAnswer.length;
    numberCharacters.clear();
    userAnswerCharacters.clear();
    textSpanList.clear();
    extraText = "";
  }

  Row detect({
    required BuildContext context,
    required NumbersMemoryController controller,
  }) {
    this.c = controller;
    initializeValues();
    seperate();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: textSpanList + extraTextSpanList,
    );
  }

  seperate() {
    seperateCharacters(charList: numberCharacters, text: number);
    seperateCharacters(charList: userAnswerCharacters, text: userAnswer);
    compareLenghts();
  }

  seperateCharacters({
    required List<String> charList,
    required String text,
  }) {
    int textLength = text.length;
    for (var i = 0; i < textLength; i++) {
      String char = text[i];
      charList.add(char);
    }
  }

  compareLenghts() {
    int endPoint;
    if (numberLength > userAnswerLength) {
      endPoint = userAnswerLength - 1;
    } else {
      endPoint = numberLength - 1;
      extraText = userAnswer.substring(numberLength, userAnswerLength);
      extraTextSpanList.add(
        mText(text: extraText, lineThrough: true),
      );
    }
    strikeOut(endPoint: endPoint);
  }

  strikeOut({required endPoint}) {
    for (var i = 0; i <= endPoint; i++) {
      String answer = numberCharacters[i];
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
        fontWeight: FontWeight.bold,
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        color: Colors.white,
        fontFamily: null,
        fontSize: 14,
      ),
    );
  }
}
