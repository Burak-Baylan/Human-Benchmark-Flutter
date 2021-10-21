import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/ads/controller/ads_controller.dart';

class AdBanner {
  static AdWidget bannerAd(String adUnitId) =>
      AdWidget(ad: bannerAdW(adUnitId));

  static BannerAd bannerAdW(String adUnitId) {
    var bannerAd = AdBanner()._bannerAdW(adUnitId);
    bannerAd.load();
    return bannerAd;
  }

  String? adId;
  late AdsController c;
  static Function(Ad ad)? onAdLoaded;
  static Function(Ad ad, LoadAdError error)? onAdFailedToUpload;

  BannerAd _bannerAdW(String adUnitId) {
    c = Get.find();
    adId = adUnitId;
    BannerAd banner = getBanner();
    c.homeBanner.value = banner;
    return banner;
  }

  getBanner() => BannerAd(
        adUnitId: adId!,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) => onAdLoaded!(ad),
          onAdFailedToLoad: (ad, error) => onAdFailedToUpload!(ad, error),
        ),
      );
}
