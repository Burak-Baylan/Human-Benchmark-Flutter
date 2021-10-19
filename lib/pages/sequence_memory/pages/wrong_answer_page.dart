import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';
import 'package:human_benchmark/widgets/button/elevated_button.dart';
import 'package:human_benchmark/widgets/text/less_futured_text.dart';

class WrongAnswer extends StatelessWidget {
  WrongAnswer({Key? key}) : super(key: key);

  late SequenceMemoryController controller;

  @override
  Widget build(BuildContext context) {
    _initState();
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: _backButton(),
          ),
          Flexible(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(child: _levelText()),
                SizedBox(height: 20),
                _retryButton(context),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _initState() {
    controller = Get.find();
  }

  Widget _retryButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => _retry(),
      child: LessText.lessFuturedText(
        text: 'Retry',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      primary: MyColors.mySemiDarkYellow,
      borderRadius: 10,
      borderSideWidth: 1.5,
      borderSideColor: Colors.white,
      size: Size(Phone.width(context) / 3.5, 20),
    );
  }

  _retry(){
    controller.selectInfoPage();
  }

  Widget _levelText() {
    var levelCount =
        controller.sequenceMemoryValueController.levelCount.toString();

    return LessText.lessFuturedText(
      text: 'Level $levelCount',
      fontSize: 70,
      color: MyColors.myRed,
    );
  }

  Widget _backButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
