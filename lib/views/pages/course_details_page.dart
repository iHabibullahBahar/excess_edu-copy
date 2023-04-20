import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/consts/sizes.dart';
import 'package:excess_edu/views/pages/buy_course_page.dart';
import 'package:excess_edu/views/widgets/course_details/course_descrption_widget.dart';
import 'package:excess_edu/views/widgets/course_details/course_includes_widget.dart';
import 'package:excess_edu/views/widgets/course_details/instructor_view_widget.dart';
import 'package:excess_edu/views/widgets/course_details/section_view_widget.dart';
import '../../models/course_details_model/course_model.dart';
import '../../utils/routes.dart';
import '../widgets/course_details/rating_view_widget.dart';
import '../widgets/course_details/review_widget.dart';
import '/views/widgets/label_widget.dart';
import 'package:get/get.dart';
import '../widgets/course_details/bottom_floating_bar_widget.dart';
import '../widgets/course_details/what_you_learn_widget.dart';
import '../widgets/youtube_player_widget.dart';
import '/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/course_details/lesson_view_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../controllers/course_details_view-controller.dart';

class CourseDetailsPage extends StatefulWidget {
  int courseId;
  var courseName;

  CourseDetailsPage(this.courseId, this.courseName);

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  var courseDetailsViewContrller = Get.put(DetailsViewController());
  double padding = AppsSizeConfigs.defaultPadding;
  double horizontalPadding = AppsSizeConfigs.defaultHorizontalPadding;
  double verticalPadding = AppsSizeConfigs.defaultVerticalPadding;

  //Course Include Details
  Course? course;
  int? totalSection;
  int? totalLecture;
  int? totalDuration;
  int? totalHour;
  int? totalMinute;

  //Section View Variable
  List<bool> _isExpandedList = [];
  int totalLesson = 1;

  //Description Section
  bool _showMore = false;

  @override
  void initState() {
    super.initState();
    padding = padding + 2;
    // otherwise, retrieve the video ID from the first course in the list
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Obx(() {
            if (courseDetailsViewContrller.isLoading == true) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            course = courseDetailsViewContrller.course[0];
            totalSection = course?.courseIncludes.totalSection;
            totalLecture = course?.courseIncludes.totalVideo;
            totalDuration = course?.courseIncludes.courseDuration;
            totalHour = ((totalDuration! / 60) / 60).toInt();
            totalMinute = (totalDuration! % 60);

            return Column(
              children: [
                //Youtube Preview Video Widget Here//
                Container(
                  child: YoutubePlayerWidget(
                    videoUrl: courseDetailsViewContrller.course[0].coverVideo,
                  ),
                ),
                //Course Name  Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: horizontalPadding),
                  child: Container(
                    child: Text(
                      courseDetailsViewContrller.course[0].name,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //Course Short Details Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: horizontalPadding),
                  child: Container(
                    child: Text(
                      courseDetailsViewContrller.course[0].shortDescription,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),

                //Some of Course Details Like rating , enrolled Student Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: horizontalPadding),
                  child: RatingViewWidget(course: course!),
                ),

                //Course Instructors Section
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: horizontalPadding),
                  child: InstructorViewWidget(
                    course: course!,
                  ),
                ),
                //What You Will Learn Section Started Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: verticalPadding, horizontal: horizontalPadding),
                  child: Container(
                    child: WhatYouLearnWidget(
                      course: courseDetailsViewContrller.course[0],
                    ),
                  ),
                ),

                //Currriculum  Section Started Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: verticalPadding, horizontal: horizontalPadding),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: LabelWidget(text: "Curriculum"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            //Section Short details Here like section lesson Nad total duration
                            child: Text(
                              "${totalSection} section - ${totalLecture} lecture - ${totalHour}h ${totalMinute}min total length",
                              style: TextStyle(),
                              textScaleFactor: 1,
                            ),
                          ),
                        ),
                        //Section Widget Here
                        Container(
                          child: SectionViewWidget(
                            course: course!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Course Include Section Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: verticalPadding, horizontal: horizontalPadding),
                  child: CourseIncludesWidget(
                    course: course!,
                  ),
                ),
                //Course Description Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: verticalPadding, horizontal: horizontalPadding),
                  child:
                      CourseDescriptionWidget(description: course!.description),
                ),
                //Course Review Section Here
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: verticalPadding, horizontal: horizontalPadding),
                  child: CourseReviewWidget(
                    course: course!,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
      //Bottom Bar for Course Price and Enroll button
      bottomNavigationBar: Obx(
        () {
          if (courseDetailsViewContrller.isLoading == true) {
            return BottomBar(
              currency: "USD",
              price: 0,
              onEnrollPressed: () {},
            );
          }
          ;
          return BottomBar(
            currency: courseDetailsViewContrller.course[0].priceUnit,
            price: courseDetailsViewContrller.course[0].price,
            onEnrollPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyCoursePage(course: course!),
                ),
              );
            },
          );
        },
      ),
      extendBody: true,
    );
  }
}
