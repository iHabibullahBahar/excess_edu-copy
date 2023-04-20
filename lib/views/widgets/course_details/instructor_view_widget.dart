import 'package:flutter/material.dart';

import '../../../models/course_details_model/course_model.dart';
import '../label_widget.dart';

class InstructorViewWidget extends StatelessWidget {
  final Course course;

  InstructorViewWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWidget(text: "Program Instructor"),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(course.instructor.image),
              ),
              SizedBox(
                width: 12,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.instructor.name,
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Text(
                        "${course.instructor.designation}, ${course.instructor.institution}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
