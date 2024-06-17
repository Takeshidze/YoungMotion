import 'package:flutter/material.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';
import 'package:young_motion/features/recording_for_event/widgets/lesson_card.dart';

class LessonChooser extends StatefulWidget {
  final List<LessonDateModel> lessons; // список мероприятий
  final Function(LessonDateModel)
      onLessonSelected; // callback-функция для возврата выбранного занятия
  final Function() onNext; // callback-функция для перехода на следующий этап
  final Function()
      onPrevious; // callback-функция для перехода на предыдущий этап

  LessonChooser(
      {required this.lessons,
      required this.onLessonSelected,
      required this.onNext,
      required this.onPrevious});
  @override
  State<LessonChooser> createState() => _LessonChooserState();
}

class _LessonChooserState extends State<LessonChooser> {
  int? selectedLessonIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16),
            shrinkWrap: true,
            itemCount: widget.lessons.length,
            itemBuilder: (context, index) {
              final lesson = widget.lessons[index];
              final sel = selectedLessonIndex;
              print(sel);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLessonIndex = index;
                  });
                },
                child: LessonCard(
                  lesson: lesson,
                  isSelected:
                      selectedLessonIndex == index, // передаем флаг выбора
                ),
              );
            },
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
                    if (selectedLessonIndex != null) {
                      widget.onLessonSelected(
                          widget.lessons[selectedLessonIndex!]);
                      widget.onNext();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Далее',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
