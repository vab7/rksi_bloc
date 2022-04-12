import 'dart:convert';

import 'package:http/http.dart';
import 'package:rksi_bloc/data/core/repository/repository.dart';
import 'package:rksi_bloc/data/model/date.dart';

class RepositoryImpl<T> extends Repository<T> {
  @override
  Future<List<T>> getRepository(
      {String? type, String? index = '', String? item = ''}) async {
    final response = await get(
      Uri.parse('https://rksi.ru/export/schedule.php?type$type$item$index'),
    );
    if (response.statusCode == 200) {
      if (T == Date) {
        return dateFromJson(response.body) as List<T>;
      }
      return json.decode(response.body);
    }
    throw Error();
  }
}
