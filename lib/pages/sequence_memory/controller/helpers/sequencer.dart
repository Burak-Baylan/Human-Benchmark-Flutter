import 'package:human_benchmark/helpers/random_number_generator.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_value_controller.dart';

class Sequencer extends SequenceMemoryValueController {

  static sequence() => Sequencer()._chooseRow();

  _chooseRow() {
    int counter = 1;
    while (counter <= levelCount) {
      var rndNumber = RandomNumber.minMax(0, 9).randomNumber;
      if (!_isNumberCopy(rndNumber)) {
        getQueue.add(rndNumber);
        counter++;
      }
    }
  }

  int? previousNumber;

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
