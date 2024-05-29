import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final bool isActive;
  final String label;

  const FilterButton({Key? key, required this.label, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Colors.blue.shade100 : null;
    final textColor = isActive ? Colors.blue : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Text(
        label,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
