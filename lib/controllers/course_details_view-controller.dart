import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/course_details_model/course_model.dart';
import '/models/course_details_model/course_details_model.dart';
import 'package:get/get.dart';

class DetailsViewController extends GetxController {
  //CourseDetailsModel? courseDetailsModel;
  List<Course> course = [];
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCourseDetails();
  }

  void fetchCourseDetails() async {
    isLoading(true);
    var response =
        await rootBundle.loadString('assets/files/course_details_view.json');
    course = CourseDetailsModel.fromJson(json.decode(response)).courses;
    isLoading(false);
  }
}
