import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../index.dart';
import '../widgets/person_form.dart';

class PersonFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonBloc(repository: PersonRepositoryImpl()),
      child: PersonForm(),
    );
  }
}
