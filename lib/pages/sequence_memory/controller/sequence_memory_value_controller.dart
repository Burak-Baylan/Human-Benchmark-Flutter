import 'package:flip_card/flip_card_controller.dart';
import 'package:human_benchmark/helpers/random_number_generator.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';

class SequenceMemoryValueController extends SequenceMemoryController {
  int _levelCounter = 100;
  int get levelCount => _levelCounter;
  incrementLevel() => _levelCounter++;

  bool clickable = false;

  List<FlipCardController> flipCardControllers = [];

  List<int> queue = [];

  addControllerTheList(FlipCardController controller) {
    flipCardControllers.add(controller);
    if (flipCardControllers.length == 9) {
      play();
    }
  }

  reset() {
    flipCardControllers.clear();
  }

  play() {
    queue.clear();
    _selectQueue();
  }

  _selectQueue() {
    int counter = 1;
    while (counter <= _levelCounter) {
      var rndNumber = RandomNumber.minMax(0, 9).randomNumber;
      if (!_isNumberCopy(rndNumber)) {
        queue.add(rndNumber);
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
      previousNumber = number;
      return false;
    }else{
      previousNumber = number;
      return false;
    }
  }
}
