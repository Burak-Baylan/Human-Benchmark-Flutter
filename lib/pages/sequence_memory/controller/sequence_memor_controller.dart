import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/game_pages.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/info_page.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/wrong_answer_page.dart';

class SequenceMemoryController extends GetxController{

  var page = 0.obs;
  
  List<Widget> pages = [
    GamePage(),
    WrongAnswer(),
    InfoPage(),
  ];

  selectGamePage() => page.value = 0;
  selectWrongAnswerPage() => page.value = 1;
  selectInfoPage() => page.value = 2;

}