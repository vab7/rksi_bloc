part of 'schedule_bloc.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class LoadedSchedule extends ScheduleState {
  final Color color;
  const LoadedSchedule(this.color);
}
