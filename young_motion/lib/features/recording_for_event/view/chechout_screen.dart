import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen(
      {super.key, @PathParam.inherit('eventId') required int eventId});
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Форма для первого шага
  final _surnameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneController = TextEditingController();

  // Форма для второго шага
  List<String> _activities = [];
  String? _selectedActivity;

  // Форма для третьего шага
  String _displayName = '';
  String _displayEmail = '';
  String _displayActivity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3-Step Form"),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep += 1);
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        steps: [
          Step(
            title: Text("Шаг 1"),
            content: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInput(
                    hint: "Фамилия",
                    controller: _surnameController,
                  ),
                  CustomInput(
                    hint: "Имя",
                    controller: _nameController,
                  ),
                  CustomInput(
                    hint: "Email",
                    controller: _emailController,
                  ),
                  CustomInput(
                    hint: "Пол",
                    controller: _genderController,
                  ),
                  CustomInput(
                    hint: "Номер телефона",
                    controller: _phoneController,
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: Text("Шаг 2"),
            content: FutureBuilder(
              future: _loadActivities(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _activities = snapshot.data as List<String>;
                  return Column(
                    children: [
                      DropdownButton(
                        value: _selectedActivity,
                        onChanged: (value) {
                          setState(() => _selectedActivity = value as String);
                        },
                        items: _activities.map((activity) {
                          return DropdownMenuItem(
                            value: activity,
                            child: Text(activity),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Step(
            title: Text("Шаг 3"),
            content: Column(
              children: [
                Text("Фамилия: $_displayName"),
                Text("Имя: $_displayEmail"),
                Text("Занятие: $_displayActivity"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<String>> _loadActivities() async {
    // Здесь должен быть запрос к базе данных для загрузки занятий
    return ["Занятие 1", "Занятие 2", "Занятие 3"];
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _displayName = _surnameController.text + " " + _nameController.text;
      _displayEmail = _emailController.text;
      _displayActivity = _selectedActivity ?? "";
      setState(() => _currentStep = 2);
    }
  }
}

class CustomInput extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;

  CustomInput({required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(hintText: hint, border: OutlineInputBorder()),
      ),
    );
  }
}
