import 'package:get/get.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';

class ReactionTimeValueController extends ReactionTimeController {
  var _millisecond = 0.obs;
  var _levelCounter = 0;

  List<int> _levelMilleseconds = [];

  get levelCount => _levelCounter;

  int get millisecond => _millisecond.value;
  set millisecond(int ms) {
    _millisecond.value = ms;
    _levelController(ms);
  }

  _levelController(int ms) {
    _levelCounter++;
    _levelMilleseconds.add(ms);
    if (_levelCounter > 5) {
      reset();
      _levelController(ms);
    }
  }

  reset() {
    _levelMilleseconds.clear();
    _levelCounter = 0;
  }

  int calculateAverageScore() {
    int scoresLength = _levelMilleseconds.length;
    int allScores = 0;
    for (var i = 0; i < scoresLength; i++) {
      allScores += _levelMilleseconds[i];
    }
    return allScores ~/ 5;
  }
}
