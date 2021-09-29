import 'package:flutter/material.dart';
import 'package:human_benchmark/pages/home_page.dart';

import 'helpers/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyColors.homeLightGreen,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
