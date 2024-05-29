import 'package:flutter/material.dart';

import 'filter_button.dart';

class FilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilterButton(label: 'Секции', isActive: true),
        SizedBox(width: 8),
        FilterButton(label: 'Кружки', isActive: false),
        SizedBox(width: 8),
        FilterButton(label: 'Мероприятия', isActive: false),
      ],
    );
  }
}
