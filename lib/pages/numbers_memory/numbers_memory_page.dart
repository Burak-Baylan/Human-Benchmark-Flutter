import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'numbers_memory_pages/hint_page.dart';

class NumbersMemory extends StatefulWidget {
  NumbersMemory({Key? key}) : super(key: key);

  @override
  _NumbersMemoryState createState() => _NumbersMemoryState();
}

class _NumbersMemoryState extends State<NumbersMemory> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  late BuildContext context;
  Widget currentPage = HintPage();

  @override
  Widget build(BuildContext buildContext) {
    context = buildContext;
    return currentPage;
  }
}