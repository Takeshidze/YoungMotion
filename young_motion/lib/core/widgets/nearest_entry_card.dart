import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:young_motion/core/models/record_model.dart';

class NearesEntryCard extends StatelessWidget {
  final RecordModel recordModel;
  const NearesEntryCard({super.key, required this.recordModel});

  @override
  Widget build(BuildContext context) {
    final month = DateFormat('d MMMM', 'ru_RU').format(recordModel.datetime);
    final time = DateFormat('HH:mm').format(recordModel.datetime);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.cyan[50], // added background color
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar image
              Container(
                margin: EdgeInsets.all(8),
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(recordModel.employee.avatarUrl),
                ),
              ),
              // Name and service name
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recordModel.employee.fullName,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      recordModel.event_name,
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              // Status field
            ],
          ),
          // Start time
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Icon(Icons.access_time, size: 20.0),
                Text(
                  time,
                  style: TextStyle(fontSize: 16.0),
                ),
                Spacer(),
                Icon(Icons.date_range, size: 20.0),
                Text(
                  month,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          // Date in the bottom right corner
        ],
      ),
    );
  }
}
