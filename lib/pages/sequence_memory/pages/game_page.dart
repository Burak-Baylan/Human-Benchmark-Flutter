import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colorful_print.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';
import 'package:human_benchmark/pages/sequence_memory/values/const_values.dart';
import 'package:human_benchmark/widgets/text/less_futured_text.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    _initializeValues();
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backGroundColor.value,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: controller.backGroundColor.value,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: LessText.lessFuturedText(
                    text: 'Level: ' + controller.sequenceMemoryValueController.levelCount.toString(),
                    color: Colors.white,
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    children: widgetList,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  late SequenceMemoryController controller;
  late List<Widget> widgetList = [];

  _initializeValues() {
    controller = Get.find();
    widgetList = List.generate(9, (index) => _buildFlipCard(index));
    controller.sequenceMemoryValueController.play();
  }

  Widget _buildFlipCard(int index) {
    return Obx(
      () => InkWell(
        onTap: () => _flipCardClickController(index),
        child: AnimatedContainer(
          duration: Consts.cardAnimationDuration,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: controller.cardColors[index].value,
          ),
        ),
      ),
    );
  }

  _flipCardClickController(int index) {
    if (controller.clickable) {
      controller.sequenceMemoryValueController.userStepCheck(index);
    }
  }
}
