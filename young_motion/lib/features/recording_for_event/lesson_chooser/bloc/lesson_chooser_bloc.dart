import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:young_motion/core/models/lesson_date.dart';
import 'package:young_motion/features/recording_for_event/lesson_chooser/index.dart';

import '../repo/lesson_chooser_repository.dart';
import '../repo/lesson_chooser_repository_impl.dart';

part 'lesson_chooser_event.dart';
part 'lesson_chooser_state.dart';

class LessonChooserBloc extends Bloc<LessonChooserEvent, LessonChooserState> {
  final LessonChooserRepository _repository;

  // LessonChooserBloc({required LessonChooserRepository repository})
  //     : _repository = repository,
  //       super(LessonChooserInitialState());
  LessonChooserBloc()
      : _repository = LessonChooserRepositoryImplMock(),
        super(LessonChooserInitialState()) {
    on<LessonChooserEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
    LessonChooserEvent event,
    Emitter<LessonChooserState> emit,
  ) async {
    if (event is LoadLessonsEvent) {
      emit(LessonChooserLoadingState());
      try {
        final lessons = await _repository.getLessons();
        emit(LessonChooserLoadedState(lessons: lessons));
      } catch (e) {
        emit(LessonChooserErrorState(error: e.toString()));
      }
    } else if (event is SelectLessonEvent) {
      final currentState = state;
      if (currentState is LessonChooserLoadedState) {
        final newState =
            currentState.copyWith(selectedLessonIndex: event.index);

        emit(newState);
      }
    }
  }
}
