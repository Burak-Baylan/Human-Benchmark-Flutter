import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueController extends GetxController{

  var levelCounter = 5;
  String number = "0";

  incrementLevel() => levelCounter++;

  numberGenerator(){
    number = "";
    var random = Random();
    for (var i = 0; i>=levelCounter; i++){
      number += random.nextInt(10).toString();
    }
  }  

}