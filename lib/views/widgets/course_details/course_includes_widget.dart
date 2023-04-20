import 'package:excess_edu/views/widgets/label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/course_details_model/course_model.dart';

class CourseIncludesWidget extends StatelessWidget {
  final Course course;

  CourseIncludesWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWidget(text: "This course includes"),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.video_collection,
                  color: Colors.black54,
                ),
                SizedBox(width: 15),
                Text(
                    "${((course.courseIncludes.courseDuration / 60) / 60).toStringAsFixed(1)}  hours video lecture"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.article,
                  color: Colors.black54,
                ),
                SizedBox(width: 15),
                Text("${course.courseIncludes.totalArticle}  Articles"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.all_inclusive_rounded,
                  color: Colors.black54,
                ),
                SizedBox(width: 15),
                Text("Lifetime access"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.fact_check,
                  color: Colors.black54,
                ),
                SizedBox(width: 15),
                Text("Certificate of Completion"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
