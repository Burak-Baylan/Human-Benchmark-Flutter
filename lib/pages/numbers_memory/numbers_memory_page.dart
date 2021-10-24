import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/number_memory_value_controller.dart';

import 'controllers/numbers_memory_controller.dart';

class NumbersMemory extends StatefulWidget {
  NumbersMemory({Key? key}) : super(key: key);

  @override
  _NumbersMemoryState createState() => _NumbersMemoryState();
}

class _NumbersMemoryState extends State<NumbersMemory> {
  late NumbersMemoryController controller;
  late NumbersMemoryValueController valueController;

  @override
  void initState() {
    Phone.closeStatusBar();
    controller = Get.put(NumbersMemoryController());
    valueController = Get.put(NumbersMemoryValueController());
    controller.loadInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
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
