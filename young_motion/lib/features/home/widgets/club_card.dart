import 'package:flutter/material.dart';

class Club {
  final String imageUrl;
  final String title;
  final String discount;

  Club({required this.imageUrl, required this.title, required this.discount});
}

class ClubCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String discount;

  ClubCard(
      {required this.imageUrl, required this.title, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                discount,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 80,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
