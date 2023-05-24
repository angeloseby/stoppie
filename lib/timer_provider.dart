import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = '00', digitHours = '00';
  final stopWatch = Stopwatch();
  bool started = false;
  Timer? timer;

  String currentTimerValue = '00:00:00';
  List<String> timerFlags = [];

  updateCurrentTimer() {
    digitSeconds = seconds.toString().length == 1
        ? '0${seconds.toString()}'
        : seconds.toString();
    digitMinutes = minutes.toString().length == 1
        ? '0${minutes.toString()}'
        : minutes.toString();
    digitHours = hours.toString().length == 1
        ? '0${hours.toString()}'
        : hours.toString();

    currentTimerValue = '$digitHours:$digitMinutes:$digitSeconds';
    notifyListeners();
  }

  void pauseTimer() {
    stopWatch.stop();
    started = false;
    timerFlags.add(currentTimerValue);
    notifyListeners();
  }

  void resetTimer() {
    stopWatch
      ..reset()
      ..stop();

    started = false;
    seconds = 0;
    minutes = 0;
    hours = 0;
    timerFlags = [];
    updateCurrentTimer();
  }

  void startTimer() {
    started = true;
    stopWatch.start();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      seconds = stopWatch.elapsed.inSeconds % 60;
      minutes = stopWatch.elapsed.inMinutes % 60;
      hours = stopWatch.elapsed.inHours;

      updateCurrentTimer();
    });
  }
}
