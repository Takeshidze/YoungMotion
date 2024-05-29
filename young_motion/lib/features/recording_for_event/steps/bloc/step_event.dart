part of 'step_bloc.dart';

abstract class StepEvent {}

class NextStepEvent extends StepEvent {}

class PreviousStepEvent extends StepEvent {}

class CompleteStepEvent extends StepEvent {}
