import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/widgets/button/elevated_button.dart';

class GamesWidget {
  static CustomElevatedButton create({
    required String text,
    required Widget route,
  }) {
    return CustomElevatedButton(
      primary: MyColors.mySemiDarkYellow,
      borderSideWidth: 3,
      borderRadius: 15,
      onPressed: () => Get.to(route),
      child: Center(
        child: FittedBox(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'GemunuLibre',
                color: Colors.white,
                fontWeight: FontWeight.bold),
            maxFontSize: 60,
            minFontSize: 24,
          ),
        ),
      ),
    );
  }
}
