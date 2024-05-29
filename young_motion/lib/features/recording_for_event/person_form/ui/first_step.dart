// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:young_motion/core/models/person.dart';

// import '../bloc/person_bloc.dart';

// class FirstStep extends StatefulWidget {
//   final Function onNext;
//   const FirstStep({Key? key, required this.onNext}) : super(key: key);
//   @override
//   _FirstStepState createState() => _FirstStepState();
// }

// class _FirstStepState extends State<FirstStep> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   late TextEditingController _nameController;
//   @override
//   void initState() {
//     BlocProvider.of<FirstStepBloc>(context).add(LoadPerson());
//     _nameController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final personBloc = BlocProvider.of<FirstStepBloc>(context);
//     return SingleChildScrollView(
//       child: BlocBuilder<FirstStepBloc, FirstStepState>(
//         builder: (context, state) {
//           if (state is PersonLoaded) {
//             final person = state.person;
//             _nameController.text = person.name;
//             print(person.name);
//             return Form(
//               key: _formKey,
//               child: Container(
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     Center(
//                       child: Text("Запись",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20)),
//                     ),
//                     Divider(),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: <Widget>[
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'First Name',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                               TextFormField(
//                                 controller:
//                                     TextEditingController(text: person.name),
//                                 decoration: const InputDecoration(
//                                     hintText: 'Enter your first name',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(8.0)),
//                                       borderSide: BorderSide(
//                                           color: Colors.grey, width: 1.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                       color: Colors.blue,
//                                     )),
//                                     border: OutlineInputBorder()),
//                                 onFieldSubmitted: (value) {
//                                   setState(() {
//                                     person.name = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                     // firstNameList.add(firstName);
//                                   });
//                                 },
//                                 onChanged: (value) {
//                                   setState(() {
//                                     person.name = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value == null ||
//                                       value.isEmpty ||
//                                       value.length < 3) {
//                                     return 'First Name must contain at least 3 characters';
//                                   } else if (value
//                                       .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
//                                     return 'First Name cannot contain special characters';
//                                   }
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'Last Name',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                               TextFormField(
//                                 decoration: const InputDecoration(
//                                     hintText: 'Enter your last name',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(4.0)),
//                                       borderSide: BorderSide(
//                                           color: Colors.grey, width: 1.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                       color: Colors.blue,
//                                     )),
//                                     border: OutlineInputBorder()),
//                                 validator: (value) {
//                                   if (value == null ||
//                                       value.isEmpty ||
//                                       value.length < 3) {
//                                     return 'Last Name must contain at least 3 characters';
//                                   } else if (value
//                                       .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
//                                     return 'Last Name cannot contain special characters';
//                                   }
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   setState(() {
//                                     person.surname = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                     // lastNameList.add(lastName);
//                                   });
//                                 },
//                                 onChanged: (value) {
//                                   setState(() {
//                                     person.surname = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                   });
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'Пол',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                               DropdownButtonFormField(
//                                   decoration: const InputDecoration(
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(4.0)),
//                                         borderSide: BorderSide(
//                                             color: Colors.grey, width: 1.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                         color: Colors.blue,
//                                       )),
//                                       border: OutlineInputBorder()),
//                                   items: [
//                                     const DropdownMenuItem(
//                                       child: Text("Мужчина"),
//                                       value: Gender.male,
//                                     ),
//                                     const DropdownMenuItem(
//                                       child: Text("Женщина"),
//                                       value: Gender.female,
//                                     )
//                                   ],
//                                   hint: const Text("Выберете пол"),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       person.gender = value as Gender;
//                                       personBloc.add(SavePerson(person));
//                                       // measureList.add(measure);
//                                     });
//                                   },
//                                   onSaved: (value) {
//                                     setState(() {
//                                       person.gender = value as Gender;
//                                       personBloc.add(SavePerson(person));
//                                     });
//                                   }),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Divider(),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: <Widget>[
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Контактная информация',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500, fontSize: 18),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'Адрес электронной почты',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                               TextFormField(
//                                 decoration: const InputDecoration(
//                                     hintText: 'Email',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(8.0)),
//                                       borderSide: BorderSide(
//                                           color: Colors.grey, width: 1.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                       color: Colors.blue,
//                                     )),
//                                     border: OutlineInputBorder()),
//                                 onFieldSubmitted: (value) {
//                                   setState(() {
//                                     person.email = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                     // firstNameList.add(firstName);
//                                   });
//                                 },
//                                 onChanged: (value) {
//                                   setState(() {
//                                     person.email = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value == null ||
//                                       value.isEmpty ||
//                                       value.length < 3) {
//                                     return 'First Name must contain at least 3 characters';
//                                   } else if (value
//                                       .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
//                                     return 'First Name cannot contain special characters';
//                                   }
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'Номер телефона',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                               TextFormField(
//                                 decoration: const InputDecoration(
//                                     hintText: 'Номер телефона',
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(4.0)),
//                                       borderSide: BorderSide(
//                                           color: Colors.grey, width: 1.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                       color: Colors.blue,
//                                     )),
//                                     border: OutlineInputBorder()),
//                                 validator: (value) {
//                                   if (value == null ||
//                                       value.isEmpty ||
//                                       value.length < 3) {
//                                     return 'Last Name must contain at least 3 characters';
//                                   } else if (value
//                                       .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
//                                     return 'Last Name cannot contain special characters';
//                                   }
//                                 },
//                                 onFieldSubmitted: (value) {
//                                   setState(() {
//                                     person.phone = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                     // lastNameList.add(lastName);
//                                   });
//                                 },
//                                 onChanged: (value) {
//                                   setState(() {
//                                     person.phone = value.capitalize();
//                                     personBloc.add(SavePerson(person));
//                                   });
//                                 },
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     minimumSize: const Size.fromHeight(60)),
//                                 onPressed: () {
//                                   // Validate returns true if the form is valid, or false otherwise.
//                                   if (_formKey.currentState!.validate()) {
//                                     widget.onNext();
//                                   }
//                                 },
//                                 child: const Text("Submit"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Text('Ошибка загрузки данных');
//           }
//         },
//       ),
//     );
//   }
// }

// extension StringExtension on String {
//   // Method used for capitalizing the input from the form
//   String capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1)}";
//   }
// }
