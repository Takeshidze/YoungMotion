import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/employess_model/employee.dart';
import 'package:young_motion/core/models/events_model/event_preview_model.dart';
import 'package:young_motion/core/repository/employees_service/employee_service_impl.dart';
import 'package:young_motion/core/repository/events_service/event_service_impl.dart';
import 'package:young_motion/features/home/widgets/nearest_entry_card.dart';
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
      'iconData': Icons.settings,
      'iconColor': Colors.blue,
      'backgroundColor': Colors.blue[50],
      'title': 'Услуга 1',
    },
    {
      'iconData': Icons.help,
      'iconColor': Colors.green,
      'backgroundColor': Colors.green[50],
      'title': 'Услуга 2',
    },
    {
      'iconData': Icons.info,
      'iconColor': Colors.red,
      'backgroundColor': Colors.red[50],
      'title': 'Услуга 3',
    },
    {
      'iconData': Icons.info,
      'iconColor': Colors.red,
      'backgroundColor': Colors.red[50],
      'title': 'Услуга 4',
    },
  ];
  final List<Map<String, String>> newsList = [
    {
      'title': 'Новость 1',
      'description': 'Описание 1',
      'imageUrl': 'https://via.placeholder.com/500',
    },
    {
      'title': 'Новость 2',
      'description': 'Описание  2',
      'imageUrl': 'https://kangabdi.files.wordpress.com/2017/10/men.png',
    },
    {
      'title': 'Новость 3',
      'description': 'Описание  3',
      'imageUrl': 'https://via.placeholder.com/100',
    },
  ];

  final EmployeeServiceImpl _employeeService = EmployeeServiceImpl();
  final EventServiceImpl _eventService = EventServiceImpl();
  List<Employee> _employees = [];
  List<EventPreviewModel> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEmployees();
    _loadEventsPreview();
  }

  Future<void> _loadEmployees() async {
    var employees =
        await _employeeService.getEmployees(10); // Получаем 10 сотрудников
    setState(() {
      _employees = employees;
    });
  }

  Future<void> _loadEventsPreview() async {
    var events = await _eventService.getPreviewEvents();

    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Привет пользователь'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
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
              items: newsList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return NewsCard(
                      title: item['title'] ?? "",
                      description: item['description'] ?? "",
                      imageUrl: item['imageUrl'] ?? "",
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
            Container(margin: EdgeInsets.all(8.0), child: NearesEntryCard()),
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
                    Text(
                      'Показать еще',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
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
                      context.navigateTo(
                          EventDetailsRoute(eventId: _events[index].id));
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
                  return EmployeeCard(
                    employee: _employees[index],
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
