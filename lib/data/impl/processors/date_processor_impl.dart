import 'package:rksi_bloc/data/core/processors/date_processor.dart';

class DateProcessorImpl extends DateProcessor {
  @override
  String getDate(DateTime date) {
    final day = date.day;

    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1)).day;
    final afterTomorrow = today.add(const Duration(days: 2)).day;

    if (day == today.day) {
      return 'Сегодня';
    } else if (day == tomorrow) {
      return 'Завтра';
    } else if (day == afterTomorrow) {
      return 'Послезавтра';
    }

    String month = '';

    switch (today.month) {
      case 1:
        month = 'Янв.';
        break;
      case 2:
        month = 'Фев.';
        break;
      case 3:
        month = 'Мар.';
        break;
      case 4:
        month = 'Апр.';
        break;
      case 5:
        month = 'Май.';
        break;
      case 6:
        month = 'Июн.';
        break;
      case 7:
        month = 'Июл.';
        break;
      case 8:
        month = 'Авг.';
        break;
      case 9:
        month = 'Сен.';
        break;
      case 10:
        month = 'Окт.';
        break;
      case 11:
        month = 'Ноя.';
        break;
      default:
        month = 'Дек.';
        break;
    }

    final result = '$day, $month';
    return result;
  }

  @override
  String getRest(String time) {
    if (time == '2' || time == '4') {
      return '20';
    } else {
      return '10';
    }
  }
}
