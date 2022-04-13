import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/bloc/schedule/schedule_bloc.dart';
import 'package:rksi_bloc/data/model/schedule.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';
import 'package:rksi_bloc/resources/widgets/style/text_style.dart';
import 'package:rksi_bloc/ui/screens/schedule/text/door.dart';
import 'package:rksi_bloc/ui/screens/schedule/text/group.dart';
import 'package:rksi_bloc/ui/screens/schedule/widgets/left_linear_gradient.dart';
import 'package:rksi_bloc/ui/screens/schedule/text/subject.dart';

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
                    Row(
                      children: [
                        Text(
                          '${schedule.start} - ${schedule.end}',
                          style: TextStyle(
                            color: color,
                            fontSize: fontSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 2,
                  right: 0,
                  child: Row(
                    children: [
                      Text(
                        schedule.rest,
                        style: const TextStyle(
                          color: secondaryText,
                          fontSize: fontSize,
                        ),
                      ),
                      const SizedBox(width: 1),
                      const Icon(
                        Icons.schedule,
                        size: fontSize,
                        color: secondaryText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LeftLinearGradient(color: color),
        ],
      ),
    );
  }
}
