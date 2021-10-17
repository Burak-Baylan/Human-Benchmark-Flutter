import 'package:flip_card/flip_card_controller.dart';
import 'package:human_benchmark/helpers/timer.dart';

import '../sequence_memory_value_controller.dart';

class CardFlipper extends SequenceMemoryValueController {
  static flip() => CardFlipper()._flip();

  _flip() async {
    for (var i = 0; i <= getQueue.length - 1; i++) {
      print("START: " + getFlipCardControllers.length.toString());
      print("QUEUE INDEX: " + getQueue[i].toString());
      var card = getFlipCardControllers[getQueue[i]];
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
