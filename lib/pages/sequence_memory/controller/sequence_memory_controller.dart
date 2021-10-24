import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/ads/ads.dart';
import 'package:human_benchmark/ads/controller/ads_controller.dart';
import 'package:human_benchmark/helpers/colorful_print.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/timer.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_value_controller.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/game_page.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/info_page.dart';
import 'package:human_benchmark/pages/sequence_memory/pages/wrong_answer_page.dart';

class SequenceMemoryController extends GetxController {
  SequenceMemoryValueController get sequenceMemoryValueController =>
      Get.find<SequenceMemoryValueController>();

  AdsController get adsController => Get.find<AdsController>();

  var page = 0.obs;
  var clickable = true;
  var backGroundColor = MyColors.myBlue.obs;

  List<Rx<Color>> cardColors = [
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
    MyColors.transparentBlackForCard.obs,
  ];

  List<Widget> pages = [
    InfoPage(),
    GamePage(),
    WrongAnswer(),
  ];

  selectInfoPage() => page.value = 0;
  selectGamePage() => page.value = 1;
  selectWrongAnswerPage() => page.value = 2;

  selectCorrectAnswerBackground() =>
      backGroundColor.value = MyColors.myLightBlue;
  resetBackground() => backGroundColor.value = MyColors.myBlue;

  selectWhiteCard(int index) => cardColors[index].value = Colors.white;
  selectTransparentCard(int index) =>
      cardColors[index].value = MyColors.transparentBlackForCard;

  loadInterstitialAd() {
    AdsController aC = adsController;
    Ads.loadSeqMemoryWrongAnswerInterstitial(
      onAdLoaded: (ad) {
        ColorfulPrint.green('Loaded Interstitial ad');
        aC.sequenceMemoryInterstitialIsReady.value = true;
        aC.sequenceMemoryInterstitialAd.value = ad;
      },
      onAdFailedToLoad: (error) {
        ColorfulPrint.red('Load Interstitial ad error');
        aC.sequenceMemoryInterstitialIsReady.value = false;
      },
    );
  }

  showAd() {
    AdsController aC = adsController;
    if (aC.sequenceMemoryInterstitialIsReady.value) {
      aC.lockSeqMemoryWrongAnswerInterstitial();
      aC.showAd(adsController.sequenceMemoryInterstitialAd.value);
      MyTimer.startTimer(
        milliseconds: 120000,
        onFinished: () {
          loadInterstitialAd();
          adsController.unlockSeqMemoryWrongAnswerInterstitial();
        },
      );
    }
  }
}
