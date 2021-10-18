import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';
import 'package:human_benchmark/widgets/text/less_futured_text.dart';

import 'helpers/wrong_numbers_detecetor.dart';

class WrongAnswer extends StatelessWidget {
  WrongAnswer({Key? key}) : super(key: key);

  late NumbersMemoryController c;
  late BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    c = Get.find();
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
            LessText.lessFuturedText(
              text: 'Number',
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 10),
            LessText.lessFuturedText(
              text: c.valueController.number,
              color: Colors.white,
              fontFamily: null,
              fontSize: 14,
            ),
            SizedBox(height: 20),
            LessText.lessFuturedText(
              text: 'Your Answer',
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 10),
            WrongDetecetor(
                    answer: c.valueController.number,
                    userAnswer: c.valueController.usersAnswer)
                .detect(),
            SizedBox(height: 30),
            LessText.lessFuturedText(
              text: 'Level ${c.valueController.levelCounter}',
              color: Colors.red.shade400,
              fontSize: 50,
            ),
            SizedBox(
              height: 20,
            ),
            retryButton(),
          ],
        ),
      ),
    );
  }

  Widget retryButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(Phone.width(context) / 4, 40),
        primary: Color.fromRGBO(244, 180, 0, 1),
      ),
      onPressed: () {
        c.valueController.reset();
        c.selectShowNumberPage();
      },
      child: Text(
        'Retry',
        textAlign: TextAlign.center,
      ),
    );
  }
}
