import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rksi_bloc/resources/color/color.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  var color = primary;

  Timer? _timer;

  DateTime? _start;
  DateTime? _end;
  DateTime _now = DateTime.now();

  final _second = const Duration(seconds: 1);

  ScheduleBloc({
    required String startLesson,
    required String endLesson,
    required String date,
  }) : super(LoadingState()) {
    final dateLesson = date.split('-').map((e) => int.parse(e)).toList();
    final dayLesson = dateLesson[2];
    final monthLesson = dateLesson[1];

    if (dayLesson == _now.day && monthLesson == _now.month) {
      color = third;

      _start = DateTime.parse('$date $startLesson');
      _end = DateTime.parse('$date $endLesson');

      _timerSchedule();

      _timer = Timer.periodic(_second, (_) {
        _now = DateTime.now();
        _timerSchedule();
      });
    }

    on<LoadSchedule>((event, emit) {
      emit(LoadingState());

      emit(LoadedSchedule(color));
    });
  }

  void _timerSchedule() {
    if (!_colorIs(activity) && _now.isAfter(_start!) && _now.isBefore(_end!)) {
      color = activity;
      _setState();
    } else if (!_colorIs(secondaryText) && _now.isAfter(_end!)) {
      color = secondaryText;
      _setState();

      if (_timer != null) _timer!.cancel();
    }
  }

  void _setState() {
    if (state != LoadingState()) {
      add(LoadSchedule());
    }
  }

  bool _colorIs(Color color) => this.color == color;
}
