import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/reaction_time/pages/green_page.dart';
import 'package:human_benchmark/pages/reaction_time/pages/info_page.dart';
import 'package:human_benchmark/pages/reaction_time/pages/red_page.dart';
import 'package:human_benchmark/pages/reaction_time/pages/show_ms_page.dart';
import 'package:human_benchmark/pages/reaction_time/pages/too_soon_page.dart';

class ReactionTimeController{

  ReactionTimeController get valueController => Get.find<ReactionTimeController>();

  var page = 0.obs;

  List<Widget> pages = [
    InfoPage(),
    GreenPage(),
    TooSoonPage(),
    RedPage(),
    ShowMsPage(),
  ];

  void selectInfoPage() => page.value = 0;

  void selectGreenPage() => page.value = 1;

  void tooSoonPage() => page.value = 2;

  void selectRedPage() => page.value = 3;

  void selectShowMsPage() => page.value = 4;

}