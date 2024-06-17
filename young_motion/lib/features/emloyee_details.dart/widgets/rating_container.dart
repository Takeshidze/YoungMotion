import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class RatingContainer extends StatelessWidget {
  final double rating;
  const RatingContainer({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Column(
        children: [
          Text(
            "Рейтинг",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          Text(
            rating.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          StarRating(
            size: 16,
            rating: rating,
            color: Colors.orange,
            borderColor: Colors.grey,
            allowHalfRating: true,
            starCount: 5,
          ),
        ],
      ),
    );
  }
}
