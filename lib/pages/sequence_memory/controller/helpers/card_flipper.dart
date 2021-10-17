import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/helpers/timer.dart';

import '../sequence_memory_value_controller.dart';

class CardFlipper{
  static flip() => CardFlipper()._flip();

  CardFlipper(){
    c = Get.find();
  }

  late SequenceMemoryValueController c;
  

  _flip() async {
    for (var i = 0; i <= c.queue.length - 1; i++) {
      var card = c.flipCardControllers[c.queue[i]];
      await _startTimer(card);
      await _startTimer(card);
      print("DONE");
    }
  }

  _startTimer(FlipCardController card) async {
    await Future.delayed(
      Duration(milliseconds: 1000),
      () {
        card.toggleCard();
      },
    );
  }
}
