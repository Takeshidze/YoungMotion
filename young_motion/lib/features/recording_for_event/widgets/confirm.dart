import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';
import 'package:young_motion/core/models/person.dart';

class Confirm extends StatefulWidget {
  final LessonDateModel lesson;
  final Person person; // список мероприятий
  final Function() onConfirm; // callback-функция для перехода на следующий этап
  final Function()
      onPrevious; // callback-функция для перехода на предыдущий этап

  Confirm(
      {required this.lesson,
      required this.person,
      required this.onConfirm,
      required this.onPrevious});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Подтверждение",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Детали",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(widget.person.name + " " + widget.person.surname),
                Spacer(),
                Text(widget.person.getGenderAsString())
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(widget.person.email),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.phone, color: Colors.blue),
                SizedBox(
                  width: 16,
                ),
                Text(widget.person.phone),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Дата и время",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.date_range, color: Colors.blue),
                SizedBox(
                  width: 16,
                ),
                Text(DateFormat('d MMMM', 'ru_RU')
                    .format(widget.lesson.datetime)),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.timelapse, color: Colors.blue),
                SizedBox(
                  width: 16,
                ),
                Text(widget.lesson.datetime.hour.toString() +
                    ":" +
                    widget.lesson.datetime.minute.toString()),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Преподователь",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 16.0,
                    backgroundImage:
                        NetworkImage(widget.lesson.employee.avatarUrl),
                  ),
                ),
                Text(
                  widget.lesson.employee.fullName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onPrevious();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Назад',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Подтвердить',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
