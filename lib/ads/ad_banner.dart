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
  String? _adId;
  Function(Ad ad)? _onAdLoaded;
  Function(Ad ad, LoadAdError error)? _onAdFailedToLoad;
  late BannerAd _banner;

  AdWidget bannerAd(String adUnitId, BannerAd banner) {
    _adId = adUnitId;
    _banner = banner;
    var bannerW = _bannerAdW();
    bannerW.load();
    return AdWidget(ad: bannerW);
  }

  BannerAd _bannerAdW() {
    BannerAd banner = getBanner();
    _banner = banner;
    return banner;
  }

  BannerAd getBanner() => BannerAd(
        adUnitId: _adId!,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) => _onAdLoaded!(ad),
          onAdFailedToLoad: (ad, error) => _onAdFailedToLoad!(ad, error),
        ),
      );
}
