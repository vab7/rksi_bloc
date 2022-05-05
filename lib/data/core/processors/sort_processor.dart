import 'package:rksi_bloc/data/model/date.dart';
import 'package:rksi_bloc/data/model/schedule.dart';

abstract class SortProcessor {
  void sortDate(List<Date> date);
}
