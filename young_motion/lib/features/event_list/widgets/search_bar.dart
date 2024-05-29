import 'package:flutter/material.dart';
import 'package:young_motion/core/constants.dart';

import '../../../core/widgets/horizontal_space.dart';

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.all(4),
        hintText: 'Поиск...',
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
