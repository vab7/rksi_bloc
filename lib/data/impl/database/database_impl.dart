import 'package:hive/hive.dart';
import 'package:rksi_bloc/data/core/database/database.dart';
import 'package:rksi_bloc/data/model/date.dart';

class DatabaseImpl<T> extends Database<T> {
  @override
  Future<T?> getData({required String boxName, required String key}) async {
    var box = await Hive.openBox<T>(boxName);

    if (box.values.isNotEmpty) {
      if (T == List<dynamic>) {
        final type = (box.get(key) as List)[0].runtimeType;

        final list = box.get(key) as List<dynamic>;

        if (type == Date) {
          final values = list.map((e) => e as Date).toList();
          return values as T;
        }

        return list as T;
      }
      return box.get(key) as T;
    } else {
      return null;
    }
  }

  @override
  void saveData(
      {required String boxName, required String key, required T value}) async {
    final box = await Hive.openBox<T>(boxName);
    box.put(key, value);
  }
}
