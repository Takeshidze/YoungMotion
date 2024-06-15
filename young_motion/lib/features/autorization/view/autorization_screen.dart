import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:young_motion/features/autorization/widgets/login_form.dart';
import 'package:young_motion/features/autorization/widgets/registr_form.dart';

@RoutePage()
class AutorizationScreen extends StatefulWidget {
  @override
  State<AutorizationScreen> createState() => _AutorizationScreenState();
}

class _AutorizationScreenState extends State<AutorizationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    LoginForm(),
    RegisterForm(), // implement this widget
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Center(
                    child: Image.asset(
                  'assets/images/logo.png',
                )),
              ),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      onTap: (index) => setState(() => _currentIndex = index),
                      tabs: [
                        Tab(text: 'Войти'),
                        Tab(text: 'Зарегистрироваться'),
                      ],
                    ),
                    _screens[_currentIndex],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
