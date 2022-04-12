import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/color/color.dart';

class ScheduleProcessorImpl extends ChangeNotifier {
  var color = primary;

  Timer? _timer;

  DateTime? _start;
  DateTime? _end;
  DateTime _now = DateTime.now();

  final _second = const Duration(seconds: 1);

  ScheduleProcessorImpl({
    required String startLesson,
    required String endLesson,
    required String date,
  }) {
    final dateLesson = date.split('-').map((e) => int.parse(e)).toList();
    final dayLesson = dateLesson[2];
    final monthLesson = dateLesson[1];

    if (dayLesson == _now.day && monthLesson == _now.month) {
      color = third;

      _start = DateTime.parse('$date $startLesson');
      _end = DateTime.parse('$date $endLesson');

      timer();

      _timer = Timer.periodic(_second, (_) {
        _now = DateTime.now();
        timer();
      });
    }
  }

  void timer() {
    if (_now.isAfter(_start!) && _now.isBefore(_end!)) {
      color = activity;
      notifyListeners();
    } else if (_now.isAfter(_end!)) {
      color = secondaryText;
      notifyListeners();
      if (_timer != null) _timer!.cancel();
    } else {
      color = third;
      notifyListeners();
    }
  }
}
