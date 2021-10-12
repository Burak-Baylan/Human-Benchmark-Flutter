import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';

class SequenceMemory extends StatefulWidget {
  SequenceMemory({Key? key}) : super(key: key);

  @override
  _SequenceMemoryState createState() => _SequenceMemoryState();
}

class _SequenceMemoryState extends State<SequenceMemory> {

  late SequenceMemoryController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(SequenceMemoryController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.pages[controller.page.value]);
  }
}