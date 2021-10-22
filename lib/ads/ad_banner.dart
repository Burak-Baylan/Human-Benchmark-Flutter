import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/ads/controller/ads_controller.dart';

class AdBanner {
  set onAdLoaded(Function(Ad ad)? onLoaded) => _onAdLoaded = onLoaded;
  set onAdFailedToLoad(Function(Ad ad, LoadAdError error)? onAdFailedToLoad) =>
      _onAdFailedToLoad = onAdFailedToLoad;

  AdBanner({
    required Function(Ad ad)? onLoaded,
    required Function(Ad ad, LoadAdError error)? onAdFailedToLoad,
  }) {
    c = Get.find();
    _onAdLoaded = onLoaded;
    _onAdFailedToLoad = onAdFailedToLoad;
  }

  late AdsController c;
  String? adId;
  Function(Ad ad)? _onAdLoaded;
  Function(Ad ad, LoadAdError error)? _onAdFailedToLoad;

  AdWidget bannerAd(String adUnitId) {
    adId = adUnitId;
    var bannerW = _bannerAdW();
    bannerW.load();
    return AdWidget(ad: bannerW);
  }

  BannerAd _bannerAdW() {
    BannerAd banner = getBanner();
    c.homeBanner.value = banner;
    return banner;
  }

  BannerAd getBanner() => BannerAd(
        adUnitId: adId!,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) => _onAdLoaded!(ad),
          onAdFailedToLoad: (ad, error) => _onAdFailedToLoad!(ad, error),
        ),
      );
}
