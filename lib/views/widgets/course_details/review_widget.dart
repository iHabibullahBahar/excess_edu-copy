import 'package:excess_edu/views/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../models/course_details_model/course_model.dart';

class CourseReviewWidget extends StatelessWidget {
  final Course course;
  CourseReviewWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LabelWidget(
          text: "Student Feedback",
        ),
        Text("Rating: ${course.rating}"),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: course.ratings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${course.ratings[index].userName}",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(children: [
                      RatingBar.builder(
                        initialRating:
                            course.ratings[index].ratingVlaue?.toDouble() ?? 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        //itemPadding: EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      SizedBox(width: 20),
                      Text(
                          "${DateFormat('dd/MM/yy  HH:mm').format(course.ratings[index].dateAndTime)}"),
                    ]),
                    Text("${course.ratings[index].comment}"),
                  ],
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
