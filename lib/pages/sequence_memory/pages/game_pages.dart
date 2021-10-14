import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      body: Column(
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
              color: MyColors.myGreen,
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
    );
  }

  late SequenceMemoryController controller;
  late List<Widget> widgetList = [];

  _initializeValues() {
    controller = Get.find();
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\\
    controller.sequenceMemoryValueController.reset();
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\\
    widgetList = List.generate(9, (index) => _gridViewChilds(index));
  }

  Widget _gridViewChilds(int index) {
    return _buildFlipCard(index);
  }

  Widget _buildFlipCard(int index) {
    var flipController = _createController();
    return GestureDetector(
      onTap: _flipCardClickController(index),
      child: FlipCard(
        controller: flipController,
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        front: GestureDetector(
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
      ),
    );
  }

  _flipCardClickController(int index) {
    if (controller.clickable) {
      controller.sequenceMemoryValueController.userStepCheck(index);
    }
  }

  FlipCardController _createController() {
    FlipCardController flipCardController = FlipCardController();
    controller.sequenceMemoryValueController
        .addControllerTheList(flipCardController);
    return flipCardController;
  }
}
