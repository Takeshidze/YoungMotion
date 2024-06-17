import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:young_motion/core/models/events_model/event_detail_model.dart';
import 'package:young_motion/core/repository/events_service/event_service_impl.dart';
import 'package:young_motion/routes/app_router.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

@RoutePage()
class EventDetailsScreen extends StatefulWidget {
  final int eventId;
  const EventDetailsScreen(
      {super.key, @PathParam('eventId') this.eventId = -1});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final EventServiceImpl _eventService = EventServiceImpl();

  EventDetailModel? _event;

  @override
  void initState() {
    super.initState();
    _loadEvent();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _loadEvent() async {
    var event = await _eventService.getEventDetails(widget.eventId);

    setState(() {
      _event = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_event == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.router.maybePopTop();
                },
                icon: Icon(Icons.arrow_back)),
            title: Text(_event!.event_name),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: imgList
                          .map((item) => Container(
                                child: Center(
                                    child: Image.network(item,
                                        fit: BoxFit.cover, width: 1000)),
                              ))
                          .toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.blue)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "500 руб",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[200],
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Описание",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _event!.description,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: Colors.blue[200],
                        ),
                        Text(
                          _event!.duration,
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        SizedBox(width: 32),
                        Icon(Icons.person, color: Colors.blue[200]),
                        Text(
                          _event!.age_restricrion.toString() + " +",
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[200],
              ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(children: [
                    Row(
                      children: [
                        // Avatar image
                        Container(
                          margin: EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage(_event!.employee.avatar_url),
                          ),
                        ),
                        // Name and service name
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _event!.employee.full_name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _event!.employee.post,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        // Status field
                        Spacer(), // takes up the remaining space
                        Row(
                          children: [
                            Text(
                              _event!.employee.rating.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      ],
                    ),
                  ])),
              Divider(
                color: Colors.grey[200],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   style: ButtonStyle(
                    //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(4)),
                    //       side: BorderSide(color: Colors.blue, width: 2),
                    //     )),
                    //     padding: MaterialStateProperty.all(EdgeInsets.all(
                    //         10)), // добавляем паддинг для квадратной формы
                    //   ),
                    //   icon: Icon(Icons.favorite),
                    //   onPressed: () {},
                    // ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.pushRoute(
                              CheckoutRoute(eventId: widget.eventId));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'Записаться сейчас',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ));
    }
  }
}
