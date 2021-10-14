import 'dart:math';

import 'package:flutter/material.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/widgets/button/elevated_button.dart';
import 'package:human_benchmark/widgets/text/less_futured_text.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: LessText.lessFuturedText(
                text: 'Level 4',
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(15),
              color: MyColors.myGreen,
              child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                children: List.generate(9, (index) => _gridViewChilds(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _gridViewChilds(int index) {
    return Container(
      child: CustomElevatedButton(
        onPressed: () {
        },
        borderRadius: 10,
        child: Text(
          '$index gfdffgd',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

