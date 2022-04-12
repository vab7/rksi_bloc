import 'package:flutter/material.dart';
import 'package:rksi_bloc/data/model/date.dart';
import 'package:rksi_bloc/ui/screens/widgets/items/schedule_item.dart';

class ScheduleList extends StatelessWidget {
  final Date date;

  const ScheduleList({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedule = date.schedule;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: schedule.length,
          itemBuilder: (context, index) {
            return ScheduleItem(schedule: schedule[index]);
          },
        ),
      ],
    );
  }
}
