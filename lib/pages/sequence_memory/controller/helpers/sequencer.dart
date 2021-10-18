import 'package:get/get.dart';
import 'package:human_benchmark/helpers/colorful_print.dart';
import 'package:human_benchmark/helpers/random_number_generator.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_value_controller.dart';

class Sequencer {
  Sequencer() {
    c = Get.find();
  }

  late SequenceMemoryValueController c;

  static sequence() => Sequencer()._chooseRow();

  _chooseRow() {
    ColorfulPrint.green("Level ${c.levelCount}");
    var rndNumber = RandomNumber.minMax(0, 9).randomNumber;
    if (!_isNumberCopy(rndNumber)) {
      c.queue.add(rndNumber);
    }
  }

  static int? previousNumber;

  bool _isNumberCopy(int number) {
    if (previousNumber != null) {
      if (previousNumber == number) {
        return true;
      }
    }
    previousNumber = number;
    return false;
  }
}
