import 'package:flutter/material.dart';
import 'package:rksi_bloc/data/model/date.dart';
import 'package:rksi_bloc/ui/screens/schedule/date/date_item.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/schedule_list.dart';

class DateList extends StatelessWidget {
  final List<Date> date;

  const DateList({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: date.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 3.0),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateItem(date: date[index].date),
              ScheduleList(date: date[index]),
            ],
          );
        },
      ),
    );
  }
}
