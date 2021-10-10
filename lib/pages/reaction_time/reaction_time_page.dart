import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';

class ReactionTime extends StatefulWidget {
  ReactionTime({Key? key}) : super(key: key);

  @override
  _ReactionTimeState createState() => _ReactionTimeState();
}

class _ReactionTimeState extends State<ReactionTime> {
  
  late ReactionTimeController controller;


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    controller = Get.put(ReactionTimeController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.pages[controller.page.value]);
  }
}
