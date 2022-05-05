import 'package:rksi_bloc/data/core/processors/sort_processor.dart';
import 'package:rksi_bloc/data/model/date.dart';
import 'package:rksi_bloc/data/model/schedule.dart';

class SortProcessorImpl extends SortProcessor {
  @override
  void sortDate(dates) {
    dates.sort((Date date1, Date date2) => date1.date.compareTo(date2.date));
    dates
        .map(
          (Date date) => date.schedule.sort(
            (Schedule schedule1, Schedule schedule2) =>
                int.parse(schedule1.time).compareTo(
              int.parse(schedule2.time),
            ),
          ),
        )
        .toList();
  }
}
