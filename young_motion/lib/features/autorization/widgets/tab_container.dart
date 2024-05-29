import 'package:flutter/material.dart';

import 'login_form.dart';
import 'registr_form.dart';

class TabContainer extends StatefulWidget {
  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  String selectedTab = 'Войти';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTab = 'Войти';
            });
          },
          child: Text('Войти'),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTab = 'Зарегистрироваться';
            });
          },
          child: Text('Зарегистрироваться'),
        ),
        SizedBox(height: 20.0),
        selectedTab == 'Войти'
            ? LoginForm()
            : selectedTab == 'Зарегистрироваться'
                ? RegisterForm()
                : Container(),
      ],
    );
  }
}
