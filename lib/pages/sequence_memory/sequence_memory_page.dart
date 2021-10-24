import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_value_controller.dart';

class SequenceMemory extends StatefulWidget {
  SequenceMemory({Key? key}) : super(key: key);

  @override
  _SequenceMemoryState createState() => _SequenceMemoryState();
}

class _SequenceMemoryState extends State<SequenceMemory> {
  late SequenceMemoryController sequenceMemoryController;
  late SequenceMemoryValueController sequenceMemoryValueController;

  @override
  void initState() {
    super.initState();
    Phone.closeStatusBar();
    sequenceMemoryController = Get.put(SequenceMemoryController());
    sequenceMemoryValueController = Get.put(SequenceMemoryValueController());
    _loadAd();
  }

  _loadAd() => sequenceMemoryController.loadInterstitialAd();

  @override
  void dispose() {
    sequenceMemoryValueController.hardReset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Obx(() =>
      sequenceMemoryController.pages[sequenceMemoryController.page.value]);
}
