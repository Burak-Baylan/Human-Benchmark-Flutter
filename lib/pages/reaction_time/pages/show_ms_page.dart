import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/numbers_memory/pages/results_pages/widgets/less_futured_text.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';

class ShowMsPage extends StatefulWidget {
  ShowMsPage({Key? key}) : super(key: key);

  @override
  _ShowMsPageState createState() => _ShowMsPageState();
}

class _ShowMsPageState extends State<ShowMsPage> {
  late ReactionTimeController controller;
  late String ms;

  @override
  Widget build(BuildContext context) {
    _initialValues();
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      body: Center(
        child: Column(
          children: [
            Container(
              height: Phone.heigth(context) / 1.5,
              alignment: Alignment.bottomCenter,
              child: showDetailsWdgt(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: Phone.heigth(context) / 3,
              child: continueButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget continueButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () => controller.selectRedPage(),
        child: LessText.lessFuturedText(
          text: "Continue",
          fontFamily: 'GemunuLibre',
          color: Colors.white,
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(251, 189, 5, 1)),
          fixedSize: MaterialStateProperty.all(
            Size(Phone.width(context) / 1.2, 50),
          ),
        ),
      ),
    );
  }

  Widget showDetailsWdgt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FittedBox(
          child: Icon(
            Icons.watch_later_outlined,
            color: Colors.white,
            size: 100,
          ),
        ),
        SizedBox(height: 15),
        FittedBox(
          child: LessText.lessFuturedText(
            text: ms + " ms",
            fontSize: 30,
            fontFamily: 'GemunuLibre',
            color: Colors.white,
          ),
        ),
        SizedBox(height: 15),
        LessText.lessFuturedText(
          text: "${controller.valueController.levelCount}/5",
          fontFamily: 'GemunuLibre',
          fontSize: 20,
          color: Colors.white,
        ),
        SizedBox(height: 15),
        /* FittedBox(
          child: LessText.lessFuturedText(
            text: "Click Anywhere to Continue",
            fontSize: 20,
            color: Colors.white,
          ),
        ), */
      ],
    );
  }

  _initialValues() {
    controller = Get.find();
    ms = controller.valueController.millisecond.toString();
  }
}
