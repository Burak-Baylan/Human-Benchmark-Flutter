import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  late BuildContext context;
  late ReactionTimeController controller;

  @override
  Widget build(BuildContext buildContext) {
    this.context = buildContext;
    controller = Get.find();
    return GestureDetector(
      onTap: () => controller.selectRedPage(),
      child: Scaffold(
        backgroundColor: MyColors.myBlue,
        body: SafeArea(
          child: Container(
            width: Phone.width(context),
            height: Phone.heigth(context),
            child: Column(
              children: [
                backButton(),
                Expanded(
                  child: infoText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoText() {
    return Container(
      padding: EdgeInsets.all(35),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "When the red color turns green, click on the screen fast as possible.",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'GemunuLibre',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            Text(
              "Click anwhere to start.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'GemunuLibre',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return Container(
      alignment: Alignment.bottomLeft,
      width: Phone.width(context),
      child: IconButton(
        color: Colors.white,
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}
