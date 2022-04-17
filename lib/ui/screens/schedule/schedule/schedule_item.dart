import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/bloc/schedule/schedule_bloc.dart';
import 'package:rksi_bloc/data/model/schedule.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/gradient/left_linear_gradient.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/text/door.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/text/group.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/text/rest.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/text/start.dart';
import 'package:rksi_bloc/ui/screens/schedule/schedule/text/subject.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;

  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final type = context.read<RepositoryBloc>().type;
    final group = type == 'group' ? schedule.teacher : schedule.group;
    final color = context.read<ScheduleBloc>().color;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: secondary),
              borderRadius: const BorderRadius.all(Radius.circular(radius)),
            ),
            padding:
                const EdgeInsets.only(right: 5, top: 5, left: 10, bottom: 7),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Subject(sub: schedule.sub),
                    Group(group: group),
                    Door(door: schedule.door),
                    Start(
                        start: schedule.start, end: schedule.end, color: color)
                  ],
                ),
                Rest(rest: schedule.rest),
              ],
            ),
          ),
          LeftLinearGradient(color: color),
        ],
      ),
    );
  }
}
