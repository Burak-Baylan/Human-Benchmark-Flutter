import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/ads/allAds/ads.dart';
import 'package:human_benchmark/ads/controller/ads_controller.dart';
import 'package:human_benchmark/helpers/colorful_print.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';

class HomeBannerWidget {
  late AdsController c;

  _initS() {
    c = Get.find();
  }

  Widget create(BuildContext context) {
    _initS();
    ColorfulPrint.green('Started');
    return Obx(
      () => Visibility(
        visible: c.homeBannerAdIsReady.value,
        child: Container(
          alignment: Alignment.center,
          width: Phone.width(context),
          height: c.homeBanner.value.size.height.toDouble(),
          child: _banner(),
        ),
      ),
    );
  }

  AdWidget _banner() {
    return Ads.homeBanner(
      onAdLoaded: (ad) {
        c.homeBannerAdIsReady.value = true;
        ColorfulPrint.red('loaded');
      },
      onAdFailedToUpload: (ad, error) {
        ColorfulPrint.red('not loaded  ${error.message}');
        c.homeBannerAdIsReady.value = false;
        ad.dispose();
      },
    );
  }
}
