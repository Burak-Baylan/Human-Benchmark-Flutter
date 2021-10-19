import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/helpers/phone_properties.dart';
import 'package:human_benchmark/pages/reaction_time/reaction_time_page.dart';
import 'package:human_benchmark/pages/sequence_memory/sequence_memory_page.dart';
import 'package:human_benchmark/widgets/button/elevated_button.dart';
import 'numbers_memory/numbers_memory_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Phone.openStatusBar();
  }

  late BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    return Scaffold(
      backgroundColor: MyColors.myBlue,
      extendBodyBehindAppBar: false,
      appBar: _appBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(indent: 15, endIndent: 15),
            Expanded(
              child: Container(
                child: _gamesLyt(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: _shareButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shareButton() => CustomElevatedButton(
        size: Size(50, 20),
        primary: MyColors.mySemiDarkYellow,
        borderSideWidth: 3,
        borderRadius: 10,
        onPressed: () {/*Share*/},
        child: Icon(Icons.share),
      );

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: MyColors.myBlue,
      elevation: 0,
    );
  }

  Widget _gamesLyt() {
    return GridView.count(
      padding: EdgeInsets.all(15),
      crossAxisSpacing: 15,
      childAspectRatio: (100 / 20),
      mainAxisSpacing: 15,
      crossAxisCount: 1,
      children: [
        _gamesWdgt(
          text: "Reaction Time",
          route: ReactionTime(),
        ),
        _gamesWdgt(
          text: "Numbers Memory",
          route: NumbersMemory(),
        ),
        _gamesWdgt(
          text: "Sequence Memory",
          route: SequenceMemory(),
        ),
      ],
    );
  }

  Widget _gamesWdgt({required String text, required Widget route}) {
    return CustomElevatedButton(
      primary: MyColors.mySemiDarkYellow,
      borderSideWidth: 3,
      borderRadius: 15,
      onPressed: () => Get.to(route),
      child: Center(
        child: FittedBox(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'GemunuLibre',
                color: Colors.white,
                fontWeight: FontWeight.bold),
            maxFontSize: 60,
            minFontSize: 24,
          ),
        ),
      ),
    );
  }
}
