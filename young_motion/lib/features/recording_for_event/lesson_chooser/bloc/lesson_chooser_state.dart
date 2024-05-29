part of 'lesson_chooser_bloc.dart';

class LessonChooserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LessonChooserInitialState extends LessonChooserState {}

class LessonChooserLoadingState extends LessonChooserState {}

class LessonChooserLoadedState extends LessonChooserState {
  final List<LessonDate> lessons;
  final int?
      selectedLessonIndex; // добавлено поле для хранения индекса выбранной карточки

  LessonChooserLoadedState({required this.lessons, this.selectedLessonIndex});

  @override
  List<Object> get props => [lessons, selectedLessonIndex ?? -1];

  LessonChooserLoadedState copyWith({
    List<LessonDate>? lessons,
    int? selectedLessonIndex,
  }) {
    return LessonChooserLoadedState(
      lessons: lessons ?? this.lessons,
      selectedLessonIndex: selectedLessonIndex ?? this.selectedLessonIndex,
    );
  }
}

class LessonChooserErrorState extends LessonChooserState {
  final String error;

  LessonChooserErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
