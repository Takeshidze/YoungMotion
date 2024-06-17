import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:young_motion/core/models/events_model/event_listing_model.dart';
import 'package:young_motion/core/repository/events_service/event_service_impl.dart';
import 'package:young_motion/features/event_list/widgets/event_card.dart';
import 'package:young_motion/routes/app_router.dart';
import '../widgets/search_bar.dart';
import '../widgets/filter_bar.dart';

@RoutePage()
class EventListingScreen extends StatefulWidget {
  @override
  State<EventListingScreen> createState() => _EventListingScreenState();
}

class _EventListingScreenState extends State<EventListingScreen> {
  final EventServiceImpl _eventService = EventServiceImpl();
  List<EventListingModel> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents(1);
  }

  Future<void> _loadEvents(int type) async {
    var events = await _eventService.getListEventsByType(type);
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Активности',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: FilterBar(
              onChanged: (index) {
                _loadEvents(index);
              },
            )),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushRoute(
                          EventDetailsRoute(eventId: _events[index].id));
                    },
                    child: EventCard(
                      event: _events[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
