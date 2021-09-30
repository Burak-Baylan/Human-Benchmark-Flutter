import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/numbers_memory/numbers_memory_pages/correct_answer_page.dart';
import 'package:human_benchmark/pages/numbers_memory/numbers_memory_pages/hint_page.dart';
import 'package:human_benchmark/pages/numbers_memory/numbers_memory_pages/show_number_page.dart';
import 'package:human_benchmark/pages/numbers_memory/numbers_memory_pages/wrong_answer_page.dart';

import '../numbers_memory_pages/ask_number_page.dart';

class NumbersMemoryController extends GetxController {

  var page = 0.obs;

  List<Widget> pages = [
    HintPage(),
    ShowNumber(),
    AskNumber(),
    CorrectAnswer(),
    WrongAnswer(),
  ];

  void select_select_hint_page() => page.value = 0;

  void select_show_number_page() => page.value = 1;

  void select_ask_number_page() => page.value = 2;

  void select_correct_answer_page() => page.value = 3;

  void select_wrong_answer_page() => page.value = 4;

  reset(){
    page.value = 0;
  }

}