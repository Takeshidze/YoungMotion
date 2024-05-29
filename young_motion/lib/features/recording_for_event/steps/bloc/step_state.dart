part of 'step_bloc.dart';

abstract class StepState extends Equatable {
  final int currentStep;

  StepState({required this.currentStep});

  @override
  List<Object?> get props => [currentStep];
}

class StepInitialState extends StepState {
  StepInitialState() : super(currentStep: 0);
}

class StepInProgressState extends StepState {
  StepInProgressState({required int currentStep})
      : super(currentStep: currentStep);
}

class StepCompletedState extends StepState {
  StepCompletedState() : super(currentStep: 2);
}
