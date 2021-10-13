import 'package:flutter/material.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/widgets/button/elevated_button.dart';
import 'package:human_benchmark/widgets/text/less_futured_text.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key}) : super(key: key);

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
              color: MyColors.myGreen,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) => _gridViewChilds(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridViewChilds(int index) {
    return CustomElevatedButton(
      onPressed: () {},
      child: null,
    );
  }
}
