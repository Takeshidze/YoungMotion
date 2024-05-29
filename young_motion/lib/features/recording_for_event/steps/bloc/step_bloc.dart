import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'step_event.dart';
part 'step_state.dart';

class StepBloc extends Bloc<StepEvent, StepState> {
  StepBloc() : super(StepInitialState()) {
    on<StepEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
    StepEvent event,
    Emitter<StepState> emit,
  ) async {
    if (event is NextStepEvent) {
      emit(StepInProgressState(currentStep: state.currentStep + 1));
    } else if (event is PreviousStepEvent) {
      emit(StepInProgressState(currentStep: state.currentStep - 1));
    } else if (event is CompleteStepEvent) {
      emit(StepCompletedState());
    }
  }
}
