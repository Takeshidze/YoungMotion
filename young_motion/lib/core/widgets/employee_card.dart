import 'package:flutter/material.dart';
import 'package:young_motion/core/models/employess_model/employee.dart';

class EmployeeCard extends StatelessWidget {
  Employee employee;

  EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white70,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(employee.avatar_url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            employee.full_name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            employee.post,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                employee.rating.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              Icon(
                Icons.star,
                size: 18,
                color: Colors.amber,
              )
            ],
          ),
        ],
      ),
    );
  }
}
