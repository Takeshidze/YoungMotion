import 'package:jiffy/jiffy.dart';

String getDurationString(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);

  if (diff.inDays == 0) {
    return 'Сегодня';
  } else if (diff.inDays == 1) {
    return 'День назад';
  } else if (diff.inDays < 7) {
    return '${diff.inDays} дней назад';
  } else if (diff.inDays < 30) {
    return '${diff.inDays ~/ 7} недель назад';
  } else if (diff.inDays < 365) {
    return '${diff.inDays ~/ 30} месяцев назад';
  } else {
    return '${diff.inDays ~/ 365} лет назад';
  }
}
