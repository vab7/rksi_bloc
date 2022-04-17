import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/schedule/schedule_bloc.dart';
import 'package:rksi_bloc/data/model/date.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/schedule_item.dart';

class ScheduleList extends StatelessWidget {
  final Date date;

  const ScheduleList({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleList = date.schedule;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: scheduleList.length,
          itemBuilder: (context, index) {
            final schedule = scheduleList[index];
            return BlocProvider(
              create: (context) => ScheduleBloc(
                startLesson: schedule.start,
                endLesson: schedule.end,
                date: schedule.date,
              )..add(LoadSchedule()),
              child: BlocBuilder<ScheduleBloc, ScheduleState>(
                builder: (context, state) {
                  if (state is LoadedSchedule) {}

                  return ScheduleItem(schedule: schedule);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
