import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:young_motion/features/home/widgets/nearest_entry_card.dart';

import '../widgets/club_card.dart';
import '../widgets/employee_card.dart';
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
  final List<Club> clubs = [
    Club(
      imageUrl: 'https://via.placeholder.com/400x300',
      title: 'Club 1',
      discount: '50% OFF',
    ),
    Club(
      imageUrl: 'https://via.placeholder.com/400x300',
      title: 'Club 2',
      discount: '30% OFF',
    ),
    Club(
      imageUrl: 'https://via.placeholder.com/400x300',
      title: 'Club 3',
      discount: '20% OFF',
    ),
    Club(
      imageUrl: 'https://via.placeholder.com/400x300',
      title: 'Club 4',
      discount: '40% OFF',
    ),
    Club(
      imageUrl: 'https://via.placeholder.com/400x300',
      title: 'Club 5',
      discount: '60% OFF',
    ),
  ];
  final List<Employee> employees = [
    Employee(
        imageUrl: 'https://kangabdi.files.wordpress.com/2017/10/men.png',
        employeeName: 'John Doe',
        position: 'Software Engineer',
        rating: 4.5,
        backgroundColor: Colors.blueAccent),
    Employee(
        imageUrl: 'https://kangabdi.files.wordpress.com/2017/10/men.png',
        employeeName: 'Jane Doe',
        position: 'Product Manager',
        rating: 4.8,
        backgroundColor: Colors.green),
  ];

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
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 4,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                disableCenter: true,
                scrollDirection: Axis.horizontal,
              ),
              items: clubs.map((club) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClubCard(
                      imageUrl: club.imageUrl,
                      title: club.title,
                      discount: club.discount,
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
                      'Наши сотрудники',
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
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: employees.length,
                itemExtent: 180,
                itemBuilder: (context, index) {
                  return EmployeeCard(
                    employee: employees[index],
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
