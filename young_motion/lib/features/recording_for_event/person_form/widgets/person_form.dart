import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:young_motion/core/models/person.dart';

import '../../steps/bloc/step_bloc.dart';
import '../index.dart';

class PersonForm extends StatefulWidget {
  @override
  _PersonFormState createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final _formKey = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _nameController = TextEditingController();
  var _genderController;
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final personBloc = context.watch<PersonBloc>();
    final personState = personBloc.state;
    if (personState is PersonStateSaved) {
      _surnameController.text = personState.person.surname;
      _nameController.text = personState.person.name;
      _genderController = personState.person.gender;
      _emailController.text = personState.person.email;
      _phoneNumberController.text = personState.person.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    final personBloc = context.watch<PersonBloc>();
    final personState = personBloc.state;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text("Запись",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'First Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  TextFormField(
                    controller: _surnameController,
                    decoration: const InputDecoration(
                        hintText: 'Enter your first name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите фамилию';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Last Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        hintText: 'Enter your last name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите имя';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Пол',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                        border: OutlineInputBorder()),
                    items: [
                      const DropdownMenuItem(
                        child: Text("Мужчина"),
                        value: Gender.male,
                      ),
                      const DropdownMenuItem(
                        child: Text("Женщина"),
                        value: Gender.female,
                      )
                    ],
                    hint: const Text("Выберете пол"),
                    onChanged: (value) {
                      _genderController = value;
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Контактная информация',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Адрес электронной почты',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Введите корректный email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Номер телефона',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                        hintText: 'Номер телефона',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 10) {
                        return 'Введите корректный номер телефона';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final person = Person(
                    surname: _surnameController.text,
                    name: _nameController.text,
                    gender: _genderController,
                    email: _emailController.text,
                    phone: _phoneNumberController.text,
                  );
                  context
                      .read<PersonBloc>()
                      .add(PersonFormSubmitted(person: person));
                  context.read<StepBloc>().add(NextStepEvent());
                }
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
