import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colorful_print.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';
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
    return Obx(() => Scaffold(
          backgroundColor: MyColors.myBlue,
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
                      text: 'Level 4',
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
        ));
  }

  late SequenceMemoryController controller;
  late List<Widget> widgetList = [];

  _initializeValues() {
    controller = Get.find();
    widgetList = List.generate(9, (index) => _buildFlipCard(index));
  }

  Widget _buildFlipCard(int index) {
    var flipController = _createController();

    return FlipCard(
      controller: flipController,
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      front: GestureDetector(
        onTap: () => _flipCardClickController(index),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Text("1"),
        ),
      ),
      back: Container(
        color: Colors.grey,
        child: Text("2"),
      ),
    );
  }

  _flipCardClickController(int index) {
    if (controller.clickable) {
      ColorfulPrint.yellow("CLICKABLE");
      controller.sequenceMemoryValueController.userStepCheck(index);
    }else{
      ColorfulPrint.red("NOT CLICKABLE");
    }
  }

  FlipCardController _createController() {
    FlipCardController flipCardController = FlipCardController();
    controller.sequenceMemoryValueController
        .addControllerTheList(flipCardController);
    return flipCardController;
  }
}
