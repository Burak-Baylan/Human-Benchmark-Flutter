import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/ads/constants/ads_id.dart';
import 'package:human_benchmark/ads/ad_banner.dart';

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
  }) =>
      AdBanner(onLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToUpload)
          .bannerAd(AdsId.homeBannerId);

  /* static sequence */

}
