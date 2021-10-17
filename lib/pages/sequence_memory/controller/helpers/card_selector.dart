import 'package:get/get.dart';
import 'package:human_benchmark/pages/sequence_memory/values/const_values.dart';
import '../sequence_memory_controller.dart';
import '../sequence_memory_value_controller.dart';

class CardSelector {
  static select() => CardSelector()._select();

  CardSelector() {
    vC = Get.find();
    c = Get.find();
  }

  late SequenceMemoryValueController vC;
  late SequenceMemoryController c;

  _select() async {
    c.clickable = false;
    for (var i = 0; i <= vC.queue.length - 1; i++) {
      var colorToBeChangeIndex = vC.queue[i];
      await _changeCard(colorToBeChangeIndex);
    }
    c.clickable = true;
  }

  _changeCard(int index) async {
    await Future.delayed(
      Consts.cardDisplayDuration,
      () => c.selectWhiteCard(index),
    );
    await Future.delayed(
      Consts.cardDisplayDuration,
      () => c.selectTransparentCard(index),
    );
  }
}
