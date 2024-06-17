import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:young_motion/core/models/events_model/event_detail_model.dart';
import 'package:young_motion/core/models/events_model/event_listing_model.dart';
import 'package:young_motion/core/models/events_model/event_news_model.dart';
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
        type_id''').inFilter('type_id', [1, 2]);
    print(response);
    return response.map((json) => EventPreviewModel.fromJson(json)).toList();
  }

  @override
  Future<List<EventNewsModal>> getNews() async {
    final response = await _supabase.from('events').select('''
        id,
        event_name,
        preview_image,
        type_id''').eq('type_id', 3);
    print(response);
    return response.map((json) => EventNewsModal.fromJson(json)).toList();
  }

  @override
  Future<List<EventListingModel>> getListEventsByType(int type) async {
    print(type);
    final response = await _supabase.from('events').select('''
        id,
        event_name,
        logo_image,
        duration, 
        price,
        age_restriction,
        employee: employee_id(full_name),
        type_id''').eq('type_id', type);

    print(response);
    return response.map((json) => EventListingModel.fromJson(json)).toList();
  }

  @override
  Future<EventDetailModel> getEventDetails(int id) async {
    final response = await _supabase
        .from('events')
        .select('''
        id,
        event_name,
        description,
        images,
        duration, 
        age_restriction,
        employees (*, post: post_id(post_name))''')
        .eq('id', id)
        .limit(1)
        .single();
    print(response);
    return EventDetailModel.fromJson(response);
  }
}
