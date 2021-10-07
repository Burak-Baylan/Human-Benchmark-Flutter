import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/value_controller.dart';

import 'controllers/numbers_memory_controller.dart';

class NumbersMemory extends StatefulWidget {
  NumbersMemory({Key? key}) : super(key: key);

  @override
  _NumbersMemoryState createState() => _NumbersMemoryState();
}

class _NumbersMemoryState extends State<NumbersMemory> {
  late NumbersMemoryController controller;
  late ValueController valueController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    controller = Get.put(NumbersMemoryController());
    valueController = Get.put(ValueController());
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusLost: () => _focusLostController(),
      child: Obx(
        () => controller.pages[controller.page.value],
      ),
    );
  }

  _focusLostController() {
    if (controller.onShowNumberPage) {
      if (!controller.protectedFocusLost) {
        Get.back();
        Get.snackbar(
          "Game Over",
          "If you leave while playing, the game is over.",
          duration: Duration(seconds: 5),
        );
      } else {
        controller.protectedFocusLost = false;
      }
    }
  }
}
