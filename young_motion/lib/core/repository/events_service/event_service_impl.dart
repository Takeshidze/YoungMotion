import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:young_motion/core/models/events_model/event_detail_model.dart';
import 'package:young_motion/core/models/events_model/event_listing_model.dart';
import 'package:young_motion/core/models/events_model/event_preview_model.dart';

part 'event_service.dart';

class EventServiceImpl implements EventService {
  final _supabase = Supabase.instance.client;

  EventServiceImpl();

  @override
  Future<List<EventPreviewModel>> getPreviewEvents() async {
    final response = await _supabase.from('events').select('''
        id,
        preview_image,
        event_types(*)''').eq('event_types.type_name', 'Секция');
    print(response);
    return response.map((json) => EventPreviewModel.fromJson(json)).toList();
  }

  @override
  Future<List<EventListingModel>> getListEventsByType(
      String type, String search) async {
    final response = await _supabase.from('events').select('''
        id,
        event_name,
        logo_image,
        duration, 
        age_restriction,
        employee: employee_id(full_name),
        event_types(*)''').eq('event_types.type_name', 'Секция');

    print(response);
    return response.map((json) => EventListingModel.fromJson(json)).toList();
  }

  @override
  Future<EventDetailModel> getEventDetails(int id) async {
    final response = await _supabase.from('events').select('''
        id,
        event_name,
        description,
        images,
        duration, 
        age_restriction,
        employees (*, post: post_id(post_name))''').eq('id', id).single();
    print(response);
    return EventDetailModel.fromJson(response);
  }
}
