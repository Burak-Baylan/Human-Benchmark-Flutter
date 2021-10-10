import 'dart:math';

class RandomNumber {
  
  Random _random = Random();
  late int randomNumber;

  RandomNumber.minMax(int min, int max) {
    randomNumber = min + _random.nextInt(max - min);
  }

  RandomNumber.onlyMax(int max) {
    randomNumber = _random.nextInt(max);
  }
}
