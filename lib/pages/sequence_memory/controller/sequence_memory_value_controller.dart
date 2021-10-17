import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/helpers/card_flipper.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/helpers/sequencer.dart';
import 'package:human_benchmark/pages/sequence_memory/controller/sequence_memory_controller.dart';

class SequenceMemoryValueController extends GetxController {

  SequenceMemoryValueController(){
    c = Get.find();
  }

  int _levelCounter = 1;
  int get levelCount => _levelCounter;
  int _userClickCounter = 0;

  List<FlipCardController> flipCardControllers = [];
  List<int> queue = [];
  List<int> userClickRow = [];

  late SequenceMemoryController c;

  addControllerTheList(FlipCardController controller) {
    flipCardControllers.add(controller);
    if (flipCardControllers.length == 9) {
      _play();
    }
  }

  incrementLevel() => _levelCounter++;

  reset() {
    userClickRow.clear();
    _userClickCounter = 0;
  }

  hardReset() {
    flipCardControllers.clear();
    _levelCounter = 0;
    reset();
  }

  _play() {
    Sequencer.sequence();
    CardFlipper.flip();
  }

  userStepCheck(int index) {
    if (queue[_userClickCounter] == index) {
      _correctStep();
    } else {
      _wrongAnswer();
    }
  }

  _correctStep() async {
    _userClickCounter++;
    if (_userClickCounter == levelCount) {
      _correctAnswerSignal();
      reset();
      incrementLevel();
      _play();
    }
  }

  _correctAnswerSignal() async {
    await Future.delayed(Duration(milliseconds: 200), () => c.selectCorrectAnswerColor());
    await Future.delayed(Duration(milliseconds: 200), () => c.resetColor());
  }

  _wrongAnswer() {
    reset();
    c.selectWrongAnswerPage();
  }
}
