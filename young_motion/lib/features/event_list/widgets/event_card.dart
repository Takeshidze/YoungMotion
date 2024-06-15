import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final int id;
  final String event_name;
  final String logo_image;
  final String duration;
  final String employee;
  final String age_restricrion;

  EventCard({
    required this.id,
    required this.event_name,
    required this.logo_image,
    required this.duration,
    required this.employee,
    required this.age_restricrion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(4),
      ),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            logo_image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  event_name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(employee),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(age_restricrion + '+'),
                    SizedBox(width: 16),
                    Text('2 часа'),
                    Spacer(),
                    Text(
                      '900 руб',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
