import 'package:flutter/material.dart';

class NearesEntryCard extends StatelessWidget {
  const NearesEntryCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://kangabdi.files.wordpress.com/2017/10/men.png'),
                ),
              ),
              // Name and service name
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Teacher Name',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Service Name',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              // Status field
              Spacer(), // takes up the remaining space
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Reserved', // change to "Paid" or "Cancelled" accordingly
                    style: TextStyle(fontSize: 16.0, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          // Start time
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Icon(Icons.access_time, size: 20.0),
                Text(
                  '10:00',
                  style: TextStyle(fontSize: 16.0),
                ),
                Spacer(),
                Icon(Icons.date_range, size: 20.0),
                Text(
                  '12.05.2024',
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
