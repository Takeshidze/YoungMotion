import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'filter_button.dart';

class FilterBar extends StatefulWidget {
  final Function(int) onChanged;
  FilterBar({required this.onChanged});
  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = 0;
            });
            widget.onChanged(1); // отправьте запрос на родительский экран
          },
          child: FilterButton(
            label: 'Секции',
            isActive: _currentIndex == 0,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = 1;
            });
            widget.onChanged(2); // отправьте запрос на родительский экран
          },
          child: FilterButton(
            label: 'Кружки',
            isActive: _currentIndex == 1,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = 2;
            });
            widget.onChanged(3); // отправьте запрос на родительский экран
          },
          child: FilterButton(
            label: 'Мероприятия',
            isActive: _currentIndex == 2,
          ),
        ),
      ],
    );
  }
}
