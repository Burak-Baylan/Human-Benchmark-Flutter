import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/ads/banner/ad_banner.dart';
import '../../ads_id.dart';

class HomeBanner {
  set onAdLoaded(Function(Ad ad) onAdLoaded) =>
      AdBanner.onAdLoaded = onAdLoaded;

  set onAdFailedToUpload(
          void Function(Ad ad, LoadAdError error) onAdFailedToUpload) =>
      AdBanner.onAdFailedToUpload = onAdFailedToUpload;

  create(String adUnitId) {
    return AdBanner.bannerAd(AdsId.homeBannerId);
  }
}
