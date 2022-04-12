import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rksi_bloc/bloc/repository/repository_bloc.dart';
import 'package:rksi_bloc/data/impl/processors/schedule_processor_impl.dart';
import 'package:rksi_bloc/data/model/schedule.dart';
import 'package:rksi_bloc/resources/color/color.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';
import 'package:rksi_bloc/resources/widgets/style/text_style.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;

  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScheduleProcessorImpl(
        startLesson: schedule.start,
        endLesson: schedule.end,
        date: schedule.date,
      ),
      child: Builder(
        builder: (context) {
          final color = context.watch<ScheduleProcessorImpl>().color;
          final bloc = context.read<RepositoryBloc>();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: secondary),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    right: 5,
                    top: 5,
                    left: 10,
                    bottom: 7,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            schedule.sub,
                            style: subjectTextStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Text(
                              bloc.type == 'group'
                                  ? schedule.teacher
                                  : schedule.group,
                              style: itemTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3.0),
                            child: Builder(builder: (context) {
                              return Text(
                                'Кабинет ${schedule.door}',
                                style: itemTextStyle,
                              );
                            }),
                          ),
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
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: 6,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        bottomLeft: Radius.circular(radius),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
