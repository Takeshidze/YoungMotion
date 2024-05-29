part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PersonStateInitial extends PersonState {}

class PersonStateLoading extends PersonState {}

class PersonStateSaved extends PersonState {
  final Person person;

  PersonStateSaved({required this.person});

  @override
  List<Object?> get props => [person];
}

class PersonStateError extends PersonState {
  final String error;

  PersonStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
