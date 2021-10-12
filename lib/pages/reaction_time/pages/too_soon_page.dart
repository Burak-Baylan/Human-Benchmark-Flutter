import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';
import 'package:human_benchmark/widgets/less_futured_text.dart';

class TooSoonPage extends StatelessWidget {
  TooSoonPage({Key? key}) : super(key: key);

  late ReactionTimeController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return GestureDetector(
      onTap: () {
        controller.valueController.reset();
        controller.selectRedPage();
      },
      child: Scaffold(
        backgroundColor: MyColors.myBlue,
        body: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: Phone.width(context),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Expanded(
                child: roofWdgt(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget roofWdgt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LessText.lessFuturedText(
          text: 'Too Soon',
          color: Colors.white,
          fontSize: 40,
        ),
        SizedBox(height: 20),
        LessText.lessFuturedText(
          text: '!',
          fontFamily: 'GemunuLibre',
          color: Colors.white,
          fontSize: 125,
        ),
        SizedBox(height: 20),
        FittedBox(
          child: LessText.lessFuturedText(
            text: 'Click to try again',
            fontFamily: 'GemunuLibre',
            color: Colors.white,
            fontSize: 45,
          ),
        ).marginOnly(bottom: 50),
      ],
    );
  }
}
