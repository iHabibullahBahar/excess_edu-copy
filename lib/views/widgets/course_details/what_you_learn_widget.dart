import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/course_details_model/course_model.dart';

class WhatYouLearnWidget extends StatelessWidget {
  final Course course;

  const WhatYouLearnWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What You will Learn',
          textScaleFactor: 1.5,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: course.whatYouLearn.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Icon(
                          Icons.check,
                          size: 25,
                        ),
                      ),
                      SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          course.whatYouLearn[index],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
