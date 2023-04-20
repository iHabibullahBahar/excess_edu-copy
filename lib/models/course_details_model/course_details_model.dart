// To parse this JSON data, do
//
//     final courseDetailsModel = courseDetailsModelFromJson(jsonString);

import 'dart:convert';
import 'course_model.dart';

CourseDetailsModel courseDetailsModelFromJson(String str) =>
    CourseDetailsModel.fromJson(json.decode(str));

String courseDetailsModelToJson(CourseDetailsModel data) =>
    json.encode(data.toJson());

class CourseDetailsModel {
  CourseDetailsModel({
    required this.courses,
  });

  List<Course> courses;

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsModel(
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
      };
}

class CourseDModel {
  static List<Course> courses = [];
}
