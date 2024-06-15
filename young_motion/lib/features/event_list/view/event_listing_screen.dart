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
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    var events = await _eventService.getListEventsByType('Секция', "");
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          'Активности',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            MySearchBar(),
            SizedBox(height: 16),
            Center(child: FilterBar()),
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
                      id: _events[index].id,
                      event_name: _events[index].event_name,
                      logo_image: _events[index].logo_image,
                      duration: _events[index].duration,
                      employee: _events[index].employee,
                      age_restricrion: _events[index].age_restricrion,
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
