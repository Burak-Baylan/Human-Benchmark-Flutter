import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/pages/reaction_time/reaction_time_page.dart';
import 'package:human_benchmark/pages/sequence_memory/sequence_memory_page.dart';

import 'numbers_memory/numbers_memory_page.dart';

class HomePage extends StatelessWidget {
  late BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 225, 175, 1),
      extendBodyBehindAppBar: false,
      appBar: _appBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                //color: Colors.green,
                child: _gamesLyt(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              //color: Colors.red,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: MyColors.homeLightGreen,
                  elevation: 0,
                  side: BorderSide(color: Colors.white, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {/* SHARE */},
                child: Icon(Icons.share),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Home",
        style: TextStyle(color: Color.fromRGBO(213, 126, 126, 1)),
      ),
      backgroundColor: Color.fromRGBO(255, 225, 175, 1), //Colors.white, //
      elevation: 0,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
    );
  }

  Widget _gamesLyt() {
    return GridView.count(
      padding: EdgeInsets.all(15),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: [
        gamesWdgt(
          text: "Reaction\nTime",
          route: ReactionTime(),
          textSize: 24,
        ),
        gamesWdgt(
          text: "Numbers\nMemory",
          route: NumbersMemory(),
          textSize: 24,
        ),
        gamesWdgt(
          text: "Sequence\nMemory",
          route: SequenceMemory(),
          textSize: 24,
        ),
        gamesWdgt(
          text: "?",
          route: NumbersMemory(),
          textSize: 55,
        ),
      ],
    );
  }

  Widget gamesWdgt({
    required String text,
    required Widget route,
    double textSize = 20,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: MyColors.homeLightGreen,
        side: BorderSide(color: Colors.white, width: 2),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onPressed: () => _sendToPage(route),
      child: Center(
        child: AutoSizeText(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'GemunuLibre', color: Colors.white),
          maxFontSize: 60,
          minFontSize: textSize,
        ),
      ),
    );
  }

  _sendToPage(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }
}
