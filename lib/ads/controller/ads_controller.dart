import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/helpers/colorful_print.dart';

class AdsController extends GetxController {
  var homeBanner = BannerAd(
    size: AdSize.banner,
    adUnitId: '',
    listener: BannerAdListener(),
    request: AdRequest(),
  ).obs;
  var homeBannerAdIsReady = false.obs;

  showAd(Object ad) {
    if (ad is InterstitialAd) {
      ad.show();
    }else{
      ColorfulPrint.red("AD TYPE ERROR.\nTYPE: ${ad.runtimeType}");
    }
  }

  var sequenceMemoryInterstitialIsReady = false.obs;
  var sequenceMemoryInterstitialAd = Object().obs;
  lockSeqMemoryWrongAnswerInterstitial() =>
      sequenceMemoryInterstitialIsReady.value = false;
  unlockSeqMemoryWrongAnswerInterstitial() =>
      sequenceMemoryInterstitialIsReady.value = true;

  var numMemoryInterstitialIsReady = false.obs;
  var numMemoryInterstitialAd = Object().obs;
  lockNumMemoryWrongAnswerInterstitial() =>
      sequenceMemoryInterstitialIsReady.value = false;
  unlockNumMemoryWrongAnswerInterstitial() =>
      sequenceMemoryInterstitialIsReady.value = true;
}
