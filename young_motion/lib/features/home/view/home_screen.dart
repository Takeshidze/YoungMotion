import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/employess_model/employee.dart';
import 'package:young_motion/core/models/employess_model/employee_details_model.dart';
import 'package:young_motion/core/models/events_model/event_detail_model.dart';
import 'package:young_motion/core/models/events_model/event_news_model.dart';
import 'package:young_motion/core/models/events_model/event_preview_model.dart';
import 'package:young_motion/core/models/profile.dart';
import 'package:young_motion/core/models/record_model.dart';
import 'package:young_motion/core/repository/employees_service/employee_service_impl.dart';
import 'package:young_motion/core/repository/events_service/event_service_impl.dart';
import 'package:young_motion/core/repository/profile_service/profile_service_impl.dart';
import 'package:young_motion/core/repository/records_service/records_service_impl.dart';
import 'package:young_motion/core/widgets/nearest_entry_card.dart';
import 'package:young_motion/routes/app_router.dart';

import '../widgets/club_card.dart';
import '../../../core/widgets/employee_card.dart';
import '../widgets/news_card.dart';
import '../widgets/service_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> serviceList = [
    {
      'iconData': Icons.person,
      'iconColor': Colors.blue,
      'backgroundColor': Colors.blue[50],
      'title': 'Стать волонотером',
    },
    {
      'iconData': Icons.help,
      'iconColor': Colors.green,
      'backgroundColor': Colors.green[50],
      'title': 'Заказать меропритие',
    },
  ];

  final EmployeeServiceImpl _employeeService = EmployeeServiceImpl();
  final EventServiceImpl _eventService = EventServiceImpl();
  final RecordSeviceImpl _recordService = RecordSeviceImpl();
  final ProfileServiceImpl _profileService = ProfileServiceImpl();
  List<Employee> _employees = [];
  List<EventPreviewModel> _events = [];
  List<EventNewsModal> _news = [];
  late Future<RecordModel> _record;
  late Future<ProfileModel> _profile;

  @override
  void initState() {
    _loadNews();
    _profile = _loadProfile();
    _record = _loadRecord();
    _loadEmployees();
    _loadEventsPreview();
    super.initState();
  }

  Future<ProfileModel> _loadProfile() async {
    ProfileModel profile = await _profileService.getProfile();
    return profile; // Получаем 10 сотрудников
  }

  Future<void> _loadEmployees() async {
    var employees =
        await _employeeService.getEmployees(10); // Получаем 10 сотрудников
    setState(() {
      _employees = employees;
    });
  }

  Future<void> _loadNews() async {
    var news = await _eventService.getNews();

    setState(() {
      _news = news;
    });
  }

  Future<void> _loadEventsPreview() async {
    var events = await _eventService.getPreviewEvents();

    setState(() {
      _events = events;
    });
  }

  Future<RecordModel> _loadRecord() async {
    RecordModel record = await _recordService.getLastRecord();
    print(record);
    return record;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<ProfileModel>(
          future: _profile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Здравствуйте ${snapshot.data!.first_name} ${snapshot.data!.second_name}',
                style: TextStyle(fontSize: 16),
              );
            } else {
              return Text('Loading...');
            }
          },
        ),
        actions: [
          FutureBuilder<ProfileModel>(
            future: _profile,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CircleAvatar(
                  radius: 20,
                  backgroundImage: snapshot.data!.avatarUrl != ''
                      ? NetworkImage(snapshot.data!.avatarUrl)
                      : null,
                );
              } else {
                return CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 4,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
              items: _news.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return NewsCard(
                      title: item.title ?? "",
                      imageUrl: item.image_url ?? "",
                      onTap: () {
                        context.router
                            .push(EventDetailsRoute(eventId: item.id));
                      },
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Услуги',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  for (int i = 0; i < serviceList.length; i += 2)
                    Row(
                      children: [
                        if (i < serviceList.length)
                          ServiceCard(
                            backgroundColor: serviceList[i]['backgroundColor'],
                            iconColor: serviceList[i]['iconColor'],
                            iconData: serviceList[i]['iconData'],
                            title: serviceList[i]['title'],
                          ),
                        if (i + 1 < serviceList.length)
                          ServiceCard(
                            backgroundColor: serviceList[i + 1]
                                ['backgroundColor'],
                            iconColor: serviceList[i + 1]['iconColor'],
                            iconData: serviceList[i + 1]['iconData'],
                            title: serviceList[i + 1]['title'],
                          ),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ближайшая запись',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            FutureBuilder<RecordModel>(
                future: _record,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        margin: EdgeInsets.all(8.0),
                        child: NearesEntryCard(
                          recordModel: snapshot.data!,
                        ));
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('У вас нет ближайших мероприятий');
                  }
                  return const CircularProgressIndicator();
                }),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Кружки и секции',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        context.navigateTo(EventTab());
                      },
                      child: Text(
                        'Показать еще',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size.zero),
                    ),
                  ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.16,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.router.navigate(EventTab(children: [
                        // push any sequence of Account routes here
                        // the last route will be the one that is currently visible
                        EventDetailsRoute(eventId: _events[index].id)
                      ]));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.4, // ширина контейнера
                      margin: EdgeInsets.all(4), // отступы
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(4), // скругленные углы
                        image: DecorationImage(
                          image: NetworkImage(
                              _events[index].image_url), // картинка
                          fit: BoxFit.cover, // масштабирование картинки
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Наши сотрудники',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        context.pushRoute(EmloyeesListRoute());
                      },
                      child: Text(
                        'Показать еще',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      style: TextButton.styleFrom(minimumSize: Size.zero),
                    ),
                  ]),
            ),
            Container(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _employees.length,
                itemExtent: 180,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushRoute(EmployeeDetailsRoute(
                          employeeId: _employees[index].id));
                    },
                    child: EmployeeCard(
                      employee: _employees[index],
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
