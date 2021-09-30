import 'dart:math';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';

class ValueController extends NumbersMemoryController{

  var levelCounter = 1;
  String number = "";

  int get levelSecond => (levelCounter + 1) * 1000;

  incrementLevel() => levelCounter++;

  String numberGenerator(){
    number = "";
    var random = Random();
    for (var i = 0; i<levelCounter; i++){
      number += random.nextInt(10).toString();
    }
    return number;
  }  

}