import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/value_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/helpers/numbers_memory_timer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ShowNumber extends StatefulWidget {
  ShowNumber({Key? key}) : super(key: key);

  @override
  _ShowNumberState createState() => _ShowNumberState();
}

class _ShowNumberState extends State<ShowNumber> {
  late NumbersMemoryController c;

  late BuildContext context;

  initializeValues() {
    c = Get.find();
    c.onShowNumberPage = true;
  }

  @override
  void dispose() {
    c.onShowNumberPage = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    initializeValues();
    startLevel();
    return Scaffold(
      backgroundColor: MyColors.numbersMemoryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              c.valueController.number,
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

  startLevel() {
    c.valueController.numberGenerator();
    NumbersMemoryTimer.startTimer(
      milliseconds: c.valueController.levelSecond,
      onFinished: () => c.selectAskNumberPage(),
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
