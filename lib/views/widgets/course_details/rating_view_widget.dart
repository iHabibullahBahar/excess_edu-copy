import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../models/course_details_model/course_model.dart';

class RatingViewWidget extends StatelessWidget {
  final Course course;

  RatingViewWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                course.rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: RatingBar.builder(
                  initialRating: course.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("${course.totalRating.toString()} ratings "),
              Text("(${course.totalEnrolled} students)"),
            ],
          ),
        ],
      ),
    );
  }
}
