import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:rksi_bloc/data/impl/processors/date_processor_impl.dart';
import 'package:rksi_bloc/data/model/schedule.dart';

part 'date.g.dart';

@HiveType(typeId: 1)
class Date {
  @HiveField(0)
  String date;

  @HiveField(1)
  List<Schedule> schedule;

  Date({
    required this.date,
    required this.schedule,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: DateProcessorImpl().getDate(
          DateTime.parse(json["date"]),
        ),
        schedule: List<Schedule>.from(
          json["schedule"].map(
            (item) => Schedule.fromJson(item),
          ),
        ),
      );
}

List<Date> dateFromJson(String str) => List<Date>.from(
      json.decode(str).map(
            (item) => Date.fromJson(item),
          ),
    );
