import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rksi_bloc/data/model/date.dart';
import 'package:rksi_bloc/data/model/schedule.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(DateAdapter());
  Hive.registerAdapter(ScheduleAdapter());

  runApp(const App());
}
