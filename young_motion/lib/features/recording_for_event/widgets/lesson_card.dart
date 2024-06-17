import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';
import 'package:young_motion/core/widgets/employee_card.dart';

class LessonCard extends StatelessWidget {
  final LessonDateModel lesson;
  final bool isSelected;
  const LessonCard({Key? key, required this.lesson, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final month = DateFormat('d MMMM', 'ru_RU').format(lesson.datetime);
    final name = lesson.employee.fullName;
    final time = DateFormat('HH:mm').format(lesson.datetime);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade100,
              width: 2)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(242, 245, 253, 1),
                borderRadius: BorderRadius.circular(4.0)),
            width: 64,
            height: 64,
            child: Center(
              child: RichText(
                textAlign: TextAlign.center, // центрируем текст
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: month.split(' ')[0], // день
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black), // день - жирный, черный
                    ),
                    TextSpan(
                      text: '\n${month.split(' ')[1]}', // месяц
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black), // месяц - обычный, черный
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundImage: NetworkImage(lesson.employee.avatarUrl),
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
