import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_value_controller.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/game_page.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/info_page.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/wrong_answer_page.dart';

class SequenceMemoryController extends GetxController {

  SequenceMemoryValueController get sequenceMemoryValueController =>
      Get.find<SequenceMemoryValueController>();

  var page = 0.obs;
  var clickable = true;
  var backGroundColor = MyColors.myBlue.obs;

  List<Widget> pages = [
    InfoPage(),
    GamePage(),
    WrongAnswer(),
  ];

  selectInfoPage() => page.value = 0;
  selectGamePage() => page.value = 1;
  selectWrongAnswerPage() => page.value = 2;

  selectCorrectAnswerColor() => backGroundColor.value = MyColors.myLightBlue;
  resetColor() => backGroundColor.value = MyColors.myBlue;
}
