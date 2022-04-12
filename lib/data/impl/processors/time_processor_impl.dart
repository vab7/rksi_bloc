import 'dart:ui';

import 'package:rksi_bloc/data/core/processors/time_processor.dart';
import 'package:rksi_bloc/resources/color/color.dart';

class TimeProcessorImpl extends TimeProcessor {
  @override
  Color colorState(int day, String start, String end) {
    var today = DateTime.now();

    if (day == today.day) {
      return third;
    } else {
      return primary;
    }
  }
}
