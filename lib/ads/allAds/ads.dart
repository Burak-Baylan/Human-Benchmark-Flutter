import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/ads/ads_id.dart';
import 'package:human_benchmark/ads/allAds/banner/home_banner.dart';

class Ads {
  Ads() {
    _initializeValues();
  }

  _initializeValues() {
    _initGoogleMobileAds();
  }

  Future<InitializationStatus> _initGoogleMobileAds() =>
      MobileAds.instance.initialize();

  static AdWidget homeBanner({
    required void Function(Ad ad) onAdLoaded,
    required void Function(Ad ad, LoadAdError error) onAdFailedToUpload,
  }) {
    var homeBanner = HomeBanner();
    homeBanner.onAdLoaded = onAdLoaded;
    homeBanner.onAdFailedToUpload = onAdFailedToUpload;
    return homeBanner.create(AdsId.homeBannerId);
  }

}
