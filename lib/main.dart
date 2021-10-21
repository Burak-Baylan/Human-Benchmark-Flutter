import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:human_benchmark/ads/controller/ads_controller.dart';
import 'package:human_benchmark/pages/home/home_page.dart';
import 'helpers/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(AdsController());
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: MyColors.myBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
