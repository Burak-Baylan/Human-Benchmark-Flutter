import 'package:get/get.dart';
import 'package:human_benchmark/pages/reaction_time/controller/recation_time_controller.dart';

class ReactionTimeValueController extends ReactionTimeController {
  var _millisecond = 0.obs;
  var _levelCounter = 0;

  get levelCount => _levelCounter;

  int get millisecond => _millisecond.value;

  set millisecond(int ms) {

    _levelCounter++;
    _levelMilleseconds.add(ms);
    _millisecond.value = ms;
    if (_levelCounter > 5) {
      _levelMilleseconds.clear();
      _levelCounter = 0;
    }

  }

  var _levelMilleseconds = [];
}
