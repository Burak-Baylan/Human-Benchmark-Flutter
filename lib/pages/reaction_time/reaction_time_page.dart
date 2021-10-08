import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';
import 'package:human_benchmark/pages/reaction_time/pages/info_page.dart';

class ReactionTime extends StatefulWidget {
  ReactionTime({Key? key}) : super(key: key);

  @override
  _ReactionTimeState createState() => _ReactionTimeState();
}

class _ReactionTimeState extends State<ReactionTime> {
  
  late ReactionTimeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ReactionTimeController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.pages[controller.page.value]);
  }
}
