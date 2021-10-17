import 'package:flip_card/flip_card_controller.dart';
import 'package:human_benchmark/helpers/colors.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/helpers/card_flipper.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/helpers/sequencer.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';

class SequenceMemoryValueController extends SequenceMemoryController {
  int _levelCounter = 1;
  int get levelCount => _levelCounter;
  int _userClickCounter = 0;

  static List<FlipCardController> flipCardControllers = [];
  static List<int> queue = [];
  static List<int> userClickRow = [];

  List<FlipCardController> get getFlipCardControllers =>
      SequenceMemoryValueController.flipCardControllers;
  List<int> get getQueue => SequenceMemoryValueController.queue;
  List<int> get getUserClickRow => SequenceMemoryValueController.userClickRow;

  addControllerTheList(FlipCardController controller) {
    flipCardControllers.add(controller);
    if (flipCardControllers.length == 9) {
      _play();
    }
  }

  incrementLevel() {
    _levelCounter++;
  }

  reset() {
    //queue.clear();
    userClickRow.clear();
    _userClickCounter = 0;
  }

  hardReset() {
    flipCardControllers.clear();
    _levelCounter = 0;
    reset();
  }

  _play() {
    queue.clear();
    Sequencer.sequence();
    print("CONTROLLERS LENGTH: " +
        flipCardControllers.length.toString() +
        " | " +
        queue.length.toString());
    CardFlipper.flip();
  }

  userStepCheck(int index) {
    print(
        "IN | QUEUE LENGTH: ${getQueue.length} | USER CLICK COUNT: $_userClickCounter");
    if (getQueue[_userClickCounter] == index) {
      print("CORRECT");
      _correctStep();
    } else {
      print("WRONG");
      _wrongAnswer();
    }
  }

  _correctStep() async {
    _userClickCounter++;
    if (_userClickCounter == levelCount) {
      reset();
      incrementLevel();
      _play();
      print("COLORS CHANGED");
    }
  }

  _wrongAnswer() {
    reset();
    selectWrongAnswerPage();
  }
}
