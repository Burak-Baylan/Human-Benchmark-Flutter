import 'package:flutter/material.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ShowNumber extends StatelessWidget {
  const ShowNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.numbersMemoryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "3",
              style: TextStyle(
                fontFamily: 'GemunuLibre',
                color: Colors.white,
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Container(
              color: Colors.white,
              child: LinearPercentIndicator(
                width: 140.0,
                lineHeight: 7,
                percent: 0.5,
                backgroundColor: Colors.grey.shade600,
                progressColor: Colors.cyan,
                linearStrokeCap: LinearStrokeCap.butt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
