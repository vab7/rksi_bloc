import 'package:hive/hive.dart';
import 'package:rksi_bloc/data/impl/processors/date_processor_impl.dart';

part 'schedule.g.dart';

@HiveType(typeId: 2)
class Schedule {
  @HiveField(0)
  String group;

  @HiveField(1)
  String date;

  @HiveField(2)
  String time;

  @HiveField(3)
  String start;

  @HiveField(4)
  String end;

  @HiveField(5)
  String teacher;

  @HiveField(6)
  String door;

  @HiveField(7)
  String sub;

  @HiveField(8)
  String rest;

  Schedule({
    required this.group,
    required this.date,
    required this.time,
    required this.start,
    required this.end,
    required this.teacher,
    required this.door,
    required this.sub,
    required this.rest,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        group: json["tt_gr"],
        date: json["tt_date"],
        time: json["tt_time"],
        start: json["tt_start"],
        end: json["tt_end"],
        teacher: json["tt_teacher"] == '' ? '?' : json['tt_teacher'],
        door: (json['tt_cab'] as String).substring(0, 3) == 'Вак'
            ? '?'
            : json['tt_cab'],
        sub: json["tt_sub"],
        rest: DateProcessorImpl().getRest(json['tt_time']),
      );
}
