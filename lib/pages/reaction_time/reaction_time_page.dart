import 'package:flutter/material.dart';

class ReactionTime extends StatefulWidget {
  ReactionTime({Key? key}) : super(key: key);

  @override
  _ReactionTimeState createState() => _ReactionTimeState();
}

class _ReactionTimeState extends State<ReactionTime> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Reaction Time"),),);
  }
}