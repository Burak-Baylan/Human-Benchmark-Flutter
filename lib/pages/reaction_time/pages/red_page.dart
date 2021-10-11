import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/helpers/random_number_generator.dart';
import 'package:human_benchmark/helpers/timer.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';
import 'package:human_benchmark/pages/reaction_time/pages/green_page.dart';

class RedPage extends StatefulWidget {
  RedPage({Key? key}) : super(key: key);

  @override
  _RedPageState createState() => _RedPageState();
}

late ReactionTimeController c;
late Timer timer;

class _RedPageState extends State<RedPage> {
  @override
  Widget build(BuildContext context) {
    _startTimer();
    c = Get.find();
    return GestureDetector(
      onTap: () {
        timer.cancel();
        c.selectTooSoonPage();
      },
      child: Scaffold(
        backgroundColor: MyColors.myRed,
        body: Container(
          width: Phone.width(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(height: 30),
              _waitForGreenText(),
            ],
          ),
        ),
      ),
    );
  }

  _startTimer() {
    var rnd = RandomNumber.minMax(2500, 6000).randomNumber;
    timer = MyTimer.startTimer(
        milliseconds: rnd, onFinished: () => c.selectGreenPage());
  }

  Widget _waitForGreenText() {
    return Text(
      "Wait For Green",
      style: TextStyle(
        fontSize: 50,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'GemunuLibre',
      ),
    );
  }
}
