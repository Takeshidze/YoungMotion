import 'package:another_stepper/another_stepper.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:young_motion/core/models/form_data_model.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';
import 'package:young_motion/core/models/person.dart';
import 'package:young_motion/core/repository/lesson_service/lesson_service_impl.dart';
import 'package:young_motion/features/recording_for_event/widgets/confirm.dart';
import 'package:young_motion/features/recording_for_event/widgets/lesson_chooser.dart';
import 'package:young_motion/features/recording_for_event/widgets/person_form.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  final int eventId;
  const CheckoutScreen({super.key, @PathParam('eventId') this.eventId = -1});
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;

  Person _person = Person();
  bool _isLoading = true;
  LessonDateModel? _selectedLesson;

  final LessonServiceImpl _lessonService = LessonServiceImpl();
  List<LessonDateModel> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _loadLessons();
  }

  Future<void> _loadProfileData() async {
    final _supabase = Supabase.instance.client;
    final user = _supabase.auth.currentUser;
    if (user != null) {
      final profilesResponse = await _supabase
          .from('profiles')
          .select('first_name, second_name')
          .eq('id', user.id)
          .single();

      setState(() {
        _person = Person(
            email: user.email.toString(),
            name: profilesResponse['first_name'],
            surname: profilesResponse['second_name']);
        _isLoading = false;
      });
    }
  }

  Future<void> _loadLessons() async {
    var lessons = await _lessonService
        .getLessonByEventId(widget.eventId); // Получаем 10 сотрудников
    setState(() {
      _lessons = lessons;
    });
  }

  void _updatePerson(Person person) {
    setState(() {
      _person = person;
      print(_person.email);
      _currentStep = _currentStep + 1;
    });
  }

  void _updateLesson(LessonDateModel lesson) {
    setState(() {
      _selectedLesson = lesson;
      print(_selectedLesson!.id);
    });
  }

  Future<void> _on_confirm() async {
    final _supabase = Supabase.instance.client;
    final user = _supabase.auth.currentUser!.id;
    FormDataModel formDataModel = FormDataModel(
        user_id: user,
        name: _person.name,
        surname: _person.surname,
        email: _person.email,
        phone: _person.phone,
        gender: _person.gender,
        lesson_id: _selectedLesson!.id);
    final response =
        await _supabase.from('records').insert(formDataModel.toJson());
    context.router.popUntilRoot();
  }

  void _on_prev() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void _on_next() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  List<StepperData> stepperData = [
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: const Icon(Icons.looks_one, color: Colors.white),
    )),
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: const Icon(Icons.looks_two, color: Colors.white),
    )),
    StepperData(
        iconWidget: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: const Icon(Icons.looks_3, color: Colors.white),
    ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Запись"),
      ),
      body: Column(
        children: [
          AnotherStepper(
            stepperList: stepperData,
            stepperDirection: Axis.horizontal,
            activeBarColor: Colors.blue,
            inActiveBarColor: Colors.grey.shade300,
            activeIndex: _currentStep,
            barThickness: 4,
            iconWidth:
                40, // Height that will be applied to all the stepper icons
            iconHeight: 40,
          ),
          Expanded(
            child: _getStepBody(),
          ),
        ],
      ),
    );
  }

  Widget _getStepBody() {
    switch (_currentStep) {
      case 0:
        if (_isLoading) {
          return CircularProgressIndicator();
        } else
          return PersonForm(person: _person, onUpdatePerson: _updatePerson);
      case 1:
        return LessonChooser(
          lessons: _lessons,
          onLessonSelected: _updateLesson,
          onNext: _on_next,
          onPrevious: _on_prev,
        );
      case 2:
        return Confirm(
          lesson: _selectedLesson!,
          person: _person,
          onConfirm: _on_confirm,
          onPrevious: _on_prev,
        );
      default:
        return Container();
    }
  }
}
