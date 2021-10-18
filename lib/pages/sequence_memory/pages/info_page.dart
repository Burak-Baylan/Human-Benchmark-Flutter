import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';
import 'package:human_benchmark/widgets/text/less_futured_text.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  late SequenceMemoryController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find();

    return Scaffold(
      backgroundColor: MyColors.myBlue,
      body: Container(
        width: Phone.width(context),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: _backButton(),
            ),
            Flexible(
              flex: 9,
              child: Container(
                padding: EdgeInsets.only(bottom: 50, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: _gameNameText(),
                    ),
                    SizedBox(height: 25),
                    FittedBox(child: _infoText()),
                    SizedBox(height: 25),
                    _startButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _gameNameText() => LessText.lessFuturedText(
        text: 'Sequence Memory\nTest',
        color: Colors.white,
        fontSize: 50,
      );

  Text _infoText() => LessText.lessFuturedText(
        text: 'Memorize the pattern.',
        color: Colors.white,
        fontSize: 20,
      );

  Widget _backButton() => Container(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      );

  ElevatedButton _startButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: MyColors.myYellow),
      onPressed: () => controller.selectGamePage(),
      child: LessText.lessFuturedText(
        text: 'Start',
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
