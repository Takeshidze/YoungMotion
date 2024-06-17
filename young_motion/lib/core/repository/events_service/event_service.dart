part of 'event_service_impl.dart';

abstract class EventService {
  Future<List<EventPreviewModel>> getPreviewEvents();
  Future<EventDetailModel> getEventDetails(int id);
  Future<List<EventListingModel>> getListEventsByType(int type);
  Future<List<EventNewsModal>> getNews();
}
