import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends GetxController {
  var homeBanner = BannerAd(
    size: AdSize.banner,
    adUnitId: '',
    listener: BannerAdListener(),
    request: AdRequest(),
  ).obs;
  var homeBannerAdIsReady = false.obs;
}
