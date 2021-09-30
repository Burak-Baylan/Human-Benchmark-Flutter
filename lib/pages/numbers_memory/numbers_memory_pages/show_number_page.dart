import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/value_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/helpers/numbers_memory_timer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ShowNumber extends StatelessWidget {
  ShowNumber({Key? key}) : super(key: key);

  late NumbersMemoryController c;
  late BuildContext context;

  initializeValues() {
    c = Get.find();
  }

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    initializeValues();
    countDown();

    return Scaffold(
      backgroundColor: MyColors.numbersMemoryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              c.valueController.numberGenerator(),
              style: TextStyle(
                fontFamily: 'GemunuLibre',
                color: Colors.white,
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Phone.width(context) / 3),
              child: buildProgressBar(),
            ),
          ],
        ),
      ),
    );
  }

  countDown() async {
    await NumbersMemoryTimer.startTimer(
      milliseconds: c.valueController.levelSecond,
      onFinished: () => c.select_ask_number_page(),
    );
  }

  Widget buildProgressBar() {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(180 / 360),
      child: LinearPercentIndicator(
        width: Phone.width(context) / 3,
        lineHeight: 5,
        animation: true,
        animationDuration: c.valueController.levelSecond,
        percent: 1,
        linearStrokeCap: LinearStrokeCap.butt,
        backgroundColor: Colors.white,
        progressColor: Colors.grey,
      ),
    );
  }
}