import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:young_motion/features/recording_for_event/lesson_chooser/index.dart';

import '../steps/bloc/step_bloc.dart' as my_step;
import '../person_form/ui/person_form_screen.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<my_step.StepBloc>(
        create: (context) => my_step.StepBloc(),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              child: Column(
                children: [
                  MyAnotherStepper(),
                  Expanded(child: _buildCurrentScreen(context)),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildCurrentScreen(BuildContext context) {
    return BlocBuilder<my_step.StepBloc, my_step.StepState>(
      builder: (context, state) {
        if (state.currentStep == 0) {
          return PersonFormScreen();
        } else if (state.currentStep == 1) {
          return LessonChooserScreen();
        } else {
          return Container();
        }
      },
    );
  }
}

class MyAnotherStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<my_step.StepBloc, my_step.StepState>(
      builder: (context, state) {
        List<StepperData> stepperData = [
          StepperData(
              iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color:
                    state.currentStep >= 0 ? Colors.blue : Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Icon(Icons.looks_one,
                color: state.currentStep >= 0 ? Colors.white : Colors.grey),
          )),
          StepperData(
              iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color:
                    state.currentStep >= 1 ? Colors.blue : Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Icon(Icons.looks_two,
                color: state.currentStep >= 1 ? Colors.white : Colors.grey),
          )),
          StepperData(
              iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color:
                    state.currentStep >= 2 ? Colors.blue : Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Icon(Icons.looks_3,
                color: state.currentStep >= 2 ? Colors.white : Colors.grey),
          ))
        ];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      context
                          .read<my_step.StepBloc>()
                          .add(my_step.PreviousStepEvent());
                    },
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width / 4,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: AnotherStepper(
                    stepperList: stepperData,
                    stepperDirection: Axis.horizontal,
                    activeBarColor: Colors.blue,
                    inActiveBarColor: Colors.grey.shade300,
                    activeIndex: state.currentStep,
                    barThickness: 4,
                    iconWidth: 40,
                    iconHeight: 40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
