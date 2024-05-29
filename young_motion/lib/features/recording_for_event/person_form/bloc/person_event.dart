part of 'person_bloc.dart';

abstract class PersonEvent {}

class PersonFormSubmitted extends PersonEvent {
  final Person person;

  PersonFormSubmitted({required this.person});
}
