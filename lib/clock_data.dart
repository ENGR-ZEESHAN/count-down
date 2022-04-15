import 'package:flutter/widgets.dart';

class TimerData extends ChangeNotifier {
  int remainingTime = 60;

  int get getremaningTime => remainingTime;

  resetClock(){
    remainingTime = 60;
    notifyListeners();
    print ('==========reset Clock============');
  }

  updateremaningTime() {
    if (remainingTime > 0) {
      remainingTime--;
      notifyListeners();
    }
  }
}
