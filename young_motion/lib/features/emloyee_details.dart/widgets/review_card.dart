import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:young_motion/core/functions/duratuion_date.dart';
import 'package:young_motion/core/models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewCard({super.key, required this.reviewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 132,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey[50]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(reviewModel.user.avatarUrl),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      reviewModel.user.first_name +
                          " " +
                          reviewModel.user.second_name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text(
                        getDurationString(reviewModel.created_at),
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      StarRating(
                        size: 16,
                        color: Colors.orange,
                        rating: reviewModel.stars.toDouble(),
                        starCount: 5,
                        allowHalfRating: false,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            reviewModel.description,
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
