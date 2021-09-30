import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/numbers_memory/controllers/numbers_memory_controller.dart';
import 'package:human_benchmark/pages/numbers_memory/numbers_memory_pages/show_number_page.dart';

class HintPage extends StatelessWidget {
  HintPage({Key? key}) : super(key: key);

  late BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    return Scaffold(
      backgroundColor: MyColors.numbersMemoryBlue,
      body: SafeArea(
        child: Container(
          width: Phone.width(context),
          height: Phone.heigth(context),
          child: Column(
            children: [
              backButton(),
              Expanded(
                child: hint(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget hint() {
    return Container(
      width: Phone.width(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Numbers Memory",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'GemunuLibre',
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "The humans are remember average 7 numbers.\n",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'GemunuLibre',
                color: Colors.white,
                fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 35),
          startButton(),
        ],
      ),
    );
  }

  Widget startButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(Phone.width(context) / 2, 40),
        primary: Color.fromRGBO(244, 180, 0, 1),
      ),
      child: Text("Start"),
      onPressed: () {
        NumbersMemoryController c = Get.find();
        c.select_show_number_page();
      },
    );
  }

  Widget backButton() {
    return Container(
      alignment: Alignment.bottomLeft,
      width: Phone.width(context),
      child: IconButton(
        color: Colors.white,
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}
