import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../index.dart';
import '../widgets/lesson_list.dart';

class LessonChooserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LessonChooserBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Ближайшие занятия",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              LessonList()
            ],
          ),
        ));
  }
}
