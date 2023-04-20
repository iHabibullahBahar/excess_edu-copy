import 'dart:developer';

import 'package:excess_edu/config/app_config.dart';
import 'package:excess_edu/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/course_model.dart';

class HorizontalCourseWidget extends StatelessWidget {
  final Course horiCourse;

  const HorizontalCourseWidget({required this.horiCourse})
      : assert(horiCourse != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(horiCourse.name);
      },
      child: Container(
        width: 180,
        //color: Colors.blue,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                horiCourse.image,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                horiCourse.name,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${horiCourse.price} ${AppConfig.currency}",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
