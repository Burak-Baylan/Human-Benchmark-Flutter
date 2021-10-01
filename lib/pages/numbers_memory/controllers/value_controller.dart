import 'dart:math';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/helpers/numbers_memory_timer.dart';

class ValueController extends NumbersMemoryController{

  var levelCounter = 1;
  String number = "";

  String _usersAnswer = "";
  set usersAnswer(String answer) =>  _usersAnswer = answer;

  int get levelSecond => (levelCounter + 1) * 1000;

  incrementLevel() => levelCounter++;

  String numberGenerator(){
    number = "";
    var random = Random();
    for (var i = 1; i<=levelCounter; i++){
      number += random.nextInt(10).toString();
    }
    return number;
  }

  checkAnswer(NumbersMemoryController c){
    print("number=$number | answer=$_usersAnswer");
    if (_usersAnswer.length >= 1){
      if (_usersAnswer == number){
        //Correct Answer
      }else{
        //Wrong Answer
      }
    }
  }

}