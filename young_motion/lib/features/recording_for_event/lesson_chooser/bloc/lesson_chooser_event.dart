part of 'lesson_chooser_bloc.dart';

abstract class LessonChooserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLessonsEvent extends LessonChooserEvent {}

class SelectLessonEvent extends LessonChooserEvent {
  final int index;

  SelectLessonEvent({required this.index});
}
