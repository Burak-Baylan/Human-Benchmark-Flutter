import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/value_controller.dart';

import 'controllers/numbers_memory_controller.dart';

class NumbersMemory extends StatefulWidget {
  NumbersMemory({Key? key}) : super(key: key);

  @override
  _NumbersMemoryState createState() => _NumbersMemoryState();
}

class _NumbersMemoryState extends State<NumbersMemory> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    controller = Get.put(NumbersMemoryController());
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    controller.reset();
    super.dispose();
  }

  late NumbersMemoryController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.pages[controller.page.value]);
  }
}