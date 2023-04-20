import 'dart:developer';

import 'package:excess_edu/config/app_config.dart';
import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/utils/routes.dart';
import 'package:excess_edu/views/pages/course_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/course_model.dart';

class CourseWidget extends StatelessWidget {
  final Course course;

  const CourseWidget({required this.course}) : assert(course != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CourseDetailsPage(course.id, course.name)));
                },
                trailing: Image.asset(course.image),
                title: Text(
                  course.name,
                  style: TextStyle(color: AppColors.textColor),
                  textScaleFactor: 0.9,
                ),
                subtitle: Text(
                  "${course.price} ${AppConfig.currency}",
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 0.2,
            height: 0,
          ),
        ],
      ),
    );
  }
}
