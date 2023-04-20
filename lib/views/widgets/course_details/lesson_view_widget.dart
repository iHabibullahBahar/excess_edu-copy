import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/models/course_details_model/lesson_model.dart';
import 'package:excess_edu/models/course_details_model/section_model.dart';
import 'package:excess_edu/views/pages/video_show_page.dart';
import 'package:excess_edu/views/widgets/course_details/section_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/course_details_model/course_model.dart';

class LessonViewWidget extends StatelessWidget {
  final Section section;

  LessonViewWidget({
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: section.lessons.length,
      itemBuilder: (builder, index) {
        return Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              children: [
                Icon(
                  section.lessons[index].lessonType == "video"
                      ? Icons.ondemand_video
                      : Icons.article,
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        section.lessons[index].lessonName,
                        textScaleFactor: 1.2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          section.lessons[index].lessonType,
                          textScaleFactor: 1,
                        ),
                        Text(
                          " - ",
                        ),
                        Text(
                          section.lessons[index].lessonType == 'video'
                              ? "${((section.lessons[index].contentSize) / 60).floor()} mins"
                              : "${section.lessons[index].contentSize} pages",
                          textScaleFactor: 1,
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                if (section.lessons[index].isPreviewable)
                  GestureDetector(
                    onTap: (section.lessons[index].lessonType == "video")
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoShowPage(
                                        url: section
                                            .lessons[index].contentUrl)));
                          }
                        : () {},
                    child: Icon(
                      Icons.slow_motion_video_sharp,
                      color: AppColors.primaryColor,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
