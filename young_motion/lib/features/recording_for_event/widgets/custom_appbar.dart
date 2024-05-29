import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  CustomAppBar({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

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
    return Container(
      height: preferredSize.height,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: AnotherStepper(
                  stepperList: stepperData,
                  stepperDirection: Axis.horizontal,
                  activeBarColor: Colors.blue,
                  inActiveBarColor: Colors.grey.shade300,
                  activeIndex: 0,
                  barThickness: 4,
                  iconWidth:
                      40, // Height that will be applied to all the stepper icons
                  iconHeight: 40),
            ),
          ),
        ],
      ),
    );
  }
}

class SCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 24);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          SizedBox(width: 16),
          Text('Your custom element'),
          Spacer(),
          SizedBox(width: 16),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(24),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'System elements here',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
