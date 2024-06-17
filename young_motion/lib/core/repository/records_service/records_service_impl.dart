import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';
import 'package:young_motion/core/models/record_model.dart';

abstract class RecordSevice {
  Future<RecordModel> getLastRecord();
  Future<List<RecordModel>> getAllRecords();
}

class RecordSeviceImpl implements RecordSevice {
  final _supabase = Supabase.instance.client;

  RecordSeviceImpl();

  @override
  Future<List<RecordModel>> getAllRecords() async {
    final response = await _supabase.from('records').select('''
        id,
        user_id,
        lesson: lesson_id(
          id,
          datetime,
          event: event_id(
            event_name,
            employee: employee_id(       
              id,
              full_name,
              avatar_url,
              post: post_id(post_name)
            )
          )
        )
        ''').eq('user_id', _supabase.auth.currentUser!.id);
    print(response);
    return response.map((json) => RecordModel.fromJson(json)).toList();
  }

  @override
  Future<RecordModel> getLastRecord() async {
    final response = await _supabase.from('records').select('''
        id,
        user_id,
        lesson: lesson_id(
          id,
          datetime,
          event: event_id(
            event_name,
            employee: employee_id(       
              id,
              full_name,
              avatar_url,
              post: post_id(post_name)
            )
          )
        )
        ''').eq('user_id', _supabase.auth.currentUser!.id);
    List<RecordModel> records =
        response.map((e) => RecordModel.fromJson(e)).toList();
    if (response != null) {
      List<RecordModel> records =
          response.map((e) => RecordModel.fromJson(e)).toList();
      RecordModel? minRecord = records.reduce((current, next) {
        return current.datetime.compareTo(next.datetime) < 0 ? current : next;
      });
      return minRecord;
    } else {
      throw Exception('Response is null');
    }
  }
}
