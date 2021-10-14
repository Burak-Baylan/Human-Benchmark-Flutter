import 'package:flip_card/flip_card_controller.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/helpers/sequencer.dart';
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
      print("LENGTH: ${flipCardControllers.length}");
    }
  }

  reset() {
    flipCardControllers.clear();
  }

  play() {
    queue.clear();
    Sequencer.sequence();
  }
}
