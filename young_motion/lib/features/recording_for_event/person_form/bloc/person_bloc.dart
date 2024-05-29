import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:young_motion/core/models/person.dart';

import '../repo/person_repository.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository _repository;

  PersonBloc({required PersonRepository repository})
      : _repository = repository,
        super(PersonStateInitial()) {
    on<PersonEvent>(mapEventToState);
  }

  @override
  void mapEventToState(
    PersonEvent event,
    Emitter<PersonState> emit,
  ) async {
    if (event is PersonFormSubmitted) {
      final person = event.person;
      try {
        emit(PersonStateSaved(person: person));
      } catch (e) {
        emit(PersonStateError(error: e.toString()));
      }
    }
  }
}
