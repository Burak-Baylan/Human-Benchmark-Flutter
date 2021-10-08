import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/number_memory_value_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/pages/ask_number_page.dart';
import 'package:human_benchmark/pages/numbers_memory/pages/results_pages/correct_answer_page.dart';
import 'package:human_benchmark/pages/numbers_memory/pages/hint_page.dart';
import 'package:human_benchmark/pages/numbers_memory/pages/show_number_page.dart';
import 'package:human_benchmark/pages/numbers_memory/pages/results_pages/wrong_answer_page.dart';

class NumbersMemoryController extends GetxController {

  NumbersMemoryValueController get valueController => Get.find<NumbersMemoryValueController>();

  var page = 0.obs;

  bool protectedFocusLost = false;
  bool onShowNumberPage = false;

  List<Widget> pages = [
    HintPage(),
    ShowNumber(),
    AskNumber(),
    CorrectAnswer(),
    WrongAnswer(),
  ];

  void selectHintPage() => page.value = 0;

  void selectShowNumberPage() => page.value = 1;

  void selectAskNumberPage() => page.value = 2;

  void selectCorrectAnswerPage() => page.value = 3;

  void selectWrongAnswerPage() => page.value = 4;

  reset(){
    page.value = 0;
    valueController.reset();
    protectedFocusLost = false;
    onShowNumberPage = false;
  }

}