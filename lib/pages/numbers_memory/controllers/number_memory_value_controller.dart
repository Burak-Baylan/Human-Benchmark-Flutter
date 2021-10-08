import 'dart:math';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';

class NumbersMemoryValueController extends NumbersMemoryController {
  var levelCounter = 1;
  String number = "";

  String _usersAnswer = "";
  set usersAnswer(String answer) => _usersAnswer = answer;
  String get usersAnswer => _usersAnswer;

  int get levelSecond => (levelCounter + 1) * 1000;

  incrementLevel() => levelCounter++;

  String numberGenerator() {
    number = "";
    var random = Random();
    for (var i = 1; i <= levelCounter; i++) {
      number += random.nextInt(10).toString();
    }
    print('Number: $number');
    return number;
  }

  checkAnswer(NumbersMemoryController c) {
    if (_usersAnswer.length >= 1) {
      var c = Get.find<NumbersMemoryController>();
      if (_usersAnswer == number) {
        c.selectCorrectAnswerPage();
      } else {
        c.selectWrongAnswerPage();
      }
    }
  }

  reset(){
    number = "";
    usersAnswer = "";
    levelCounter = 1;
  }
}
