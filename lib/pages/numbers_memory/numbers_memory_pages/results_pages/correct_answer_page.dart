import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/numbers_memory_pages/results_pages/widgets/less_futured_text.dart';

import 'helpers/wrong_numbers_detecetor.dart';

class CorrectAnswer extends StatelessWidget {
  CorrectAnswer({Key? key}) : super(key: key);

  late NumbersMemoryController c;
  late BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    c = Get.find();
    return Scaffold(
      backgroundColor: MyColors.numbersMemoryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LessText.lessFuturedText(
              text: 'Number',
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 10),
            text(
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
            LessText.lessFuturedText(
              text: c.valueController.usersAnswer,
              color: Colors.white,
              fontFamily: null,
              fontSize: 14,
            ),
            SizedBox(height: 30),
            LessText.lessFuturedText(
              text: 'Level ${c.valueController.levelCounter}',
              color: Colors.green.shade400,
              fontSize: 50,
            ),
            SizedBox(
              height: 20,
            ),
            nextButton(),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(Phone.width(context) / 4, 40),
        primary: Color.fromRGBO(244, 180, 0, 1),
      ),
      onPressed: () {
        c.valueController.incrementLevel();
        c.selectShowNumberPage();
      },
      child: Text(
        'Next',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget text({
    required String text,
    Color color = Colors.grey,
    double fontSize = 20,
    String? fontFamily = 'GemunuLibre',
  }) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
