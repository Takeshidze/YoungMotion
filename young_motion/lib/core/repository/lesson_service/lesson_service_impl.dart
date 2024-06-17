import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';

abstract class LessonService {
  Future<List<LessonDateModel>> getLessonByEventId(int id);
}

class LessonServiceImpl implements LessonService {
  final _supabase = Supabase.instance.client;

  LessonServiceImpl();

  @override
  Future<List<LessonDateModel>> getLessonByEventId(int id) async {
    final response = await _supabase.from('schedule').select('''
        id,
        datetime,
        event: event_id(
          id,
          employee: employee_id(id, full_name, avatar_url)
          )
        ''').eq('event_id', id);
    print(response);
    return response.map((json) => LessonDateModel.fromJson(json)).toList();
  }
}
