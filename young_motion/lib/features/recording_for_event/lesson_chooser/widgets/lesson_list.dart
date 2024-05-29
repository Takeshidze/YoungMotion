import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:young_motion/features/recording_for_event/lesson_chooser/bloc/lesson_chooser_bloc.dart';
import 'package:young_motion/features/recording_for_event/lesson_chooser/widgets/lesson_card.dart';

import '../index.dart';

class LessonList extends StatefulWidget {
  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  late LessonChooserBloc lessonBloc;
  @override
  void initState() {
    super.initState();
    lessonBloc = BlocProvider.of<LessonChooserBloc>(context);
    lessonBloc.add(LoadLessonsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonChooserBloc, LessonChooserState>(
      listener: (context, state) {
        if (state is LessonChooserLoadedState) {
          print('Selected lesson index: ${state.selectedLessonIndex}');
        }
      },
      builder: (context, state) {
        if (state is LessonChooserInitialState ||
            state is LessonChooserLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LessonChooserLoadedState) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16),
            shrinkWrap: true,
            itemCount: state.lessons.length,
            itemBuilder: (context, index) {
              final lesson = state.lessons[index];
              final sel = state.selectedLessonIndex;
              print(sel);
              return GestureDetector(
                onTap: () {
                  lessonBloc.add(SelectLessonEvent(index: index));
                },
                child: LessonCard(
                  lesson: lesson,
                  isSelected: state.selectedLessonIndex ==
                      index, // передаем флаг выбора
                ),
              );
            },
          );
        } else if (state is LessonChooserErrorState) {
          return Center(child: Text(state.error));
        }
        return Container();
      },
    );
  }
}
