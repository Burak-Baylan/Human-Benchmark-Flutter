import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import '../sequence_memory_controller.dart';
import '../sequence_memory_value_controller.dart';

class CardFlipper {
  static flip() => CardFlipper()._flip();

  CardFlipper() {
    vC = Get.find();
    c = Get.find();
  }

  late SequenceMemoryValueController vC;
  late SequenceMemoryController c;

  _flip() async {
    for (var i = 0; i <= vC.queue.length - 1; i++) {
      var card = vC.flipCardControllers[vC.queue[i]];
      await _startTimer(card);
      await _startTimer(card);
      print("DONE");
    }
    c.clickable = true;
  }

  _startTimer(FlipCardController card) async {
    await Future.delayed(
      Duration(milliseconds: 1000),
      () => card.toggleCard(),
    );
  }
}
