// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:young_motion/core/models/lesson_date_model.dart';
// import 'package:young_motion/core/repository/lesson_service/lesson_service_impl.dart';
// import 'package:young_motion/features/recording_for_event/lesson_chooser/bloc/lesson_chooser_bloc.dart';
// import 'package:young_motion/features/recording_for_event/widgets/lesson_card.dart';

// import '../lesson_chooser/index.dart';

// class LessonList extends StatefulWidget {
//   @override
//   State<LessonList> createState() => _LessonListState();
// }

// class _LessonListState extends State<LessonList> {
//   late int selectedLessonIndex;
//   final LessonServiceImpl _lessonService = LessonServiceImpl();
//   List<LessonDateModel> _lessons = [];


//   @override
//   void initState() {
//     super.initState();
//     _loadLessons();
//   }

//   Future<void> _loadLessons() async {
//     var lessons =
//         await _lessonService.getLessonByEventId(widget.); // Получаем 10 сотрудников
//     setState(() {
//       _lessons = employees;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => SizedBox(height: 16),
//       shrinkWrap: true,
//       itemCount: lessons.length,
//       itemBuilder: (context, index) {
//         final lesson = lessons[index];
//         final sel = selectedLessonIndex;
//         print(sel);
//         return GestureDetector(
//           onTap: () {},
//           child: LessonCard(
//             lesson: lesson,
//             isSelected: selectedLessonIndex == index, // передаем флаг выбора
//           ),
//         );
//       },
//     );
//   }
// }
