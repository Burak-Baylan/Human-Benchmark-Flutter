import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstitial {
  static load({
    required String adUnitId,
    required Function(InterstitialAd ad) onAdLoaded,
    required Function(LoadAdError error) onAdFailedToLoad,
  }) {
    AdInterstitial(
      adUnitId: adUnitId,
      onAdLoaded: onAdLoaded,
      onAdFailedToLoad: onAdFailedToLoad,
    ).go();
  }

  AdInterstitial({
    required this.adUnitId,
    required this.onAdLoaded,
    required this.onAdFailedToLoad,
  });

  late String adUnitId;
  late Function(InterstitialAd ad) onAdLoaded;
  late Function(LoadAdError error) onAdFailedToLoad;

  go() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => onAdLoaded(ad),
        onAdFailedToLoad: (error) => onAdFailedToLoad(error),
      ),
    );
  }
}
