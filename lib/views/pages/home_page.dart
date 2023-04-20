import 'dart:convert';

import 'package:excess_edu/config/app_config.dart';
import 'package:excess_edu/consts/colors.dart';
import 'package:excess_edu/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../models/course_model.dart';
import '../widgets/course_widget.dart';
import '../widgets/drawer.dart';
import '../widgets/app_bar.dart';
import '../../consts/colors.dart';
import '../widgets/horizontal_course_view_widget.dart';
import 'all_courses_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Testing Perpose
  var selectedIndex = -1;
  final List<String> categories = [
    'Development',
    'Business',
    'IT & Software',
    'Office Productivity',
    'Personal Development',
    'Design',
    'Marketing',
    'Lifestyle',
    'Photography',
    'Health & Fitness',
    'Music',
    'Teaching & Academics',
  ];

  //Testing Perpose

  bool _isMounted = false;
  @override
  void initState() {
    super.initState();
    _isMounted = true;
    loadData();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var courseJson = await rootBundle.loadString("assets/files/courses.json");
    var decodedData = jsonDecode(courseJson);
    var coursesData = decodedData["courses"];
    CourseModel.courses =
        List.from(coursesData).map((course) => Course.fromMap(course)).toList();
    if (_isMounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          //Welcome Section Here
          Container(
            color: AppColors.secondaryBackgroundColor,
            height: 60,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 8, 8),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: AppColors.textColor),
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(AppConfig.logo),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Wecome User",
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
              //height: 10,
              ),
          //All Catagories Section Start Here
          Container(
            color: AppColors.secondaryBackgroundColor,
            height: 130,
            width: screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 18),
              child: Column(
                children: [
                  //Heading Name "All Catagories Start Here"
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "All categories",
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                      textScaleFactor: 1.5,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? Colors.blue.withOpacity(0.1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 1),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: index == selectedIndex
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            color: AppColors.secondaryBackgroundColor,
            height: 240,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 0, 8),
              child: Column(children: [
                //Section Name And See all button Arear
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
                      //Section Area Name here
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Featured courses",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 1.5,
                        ),
                      ),
                      //See all Button Here
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 40,
                            width: 100,
                            child: TextButton(
                              onPressed: () {},
                              child: Row(children: [
                                Text(
                                  "see all",
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: AppColors.textColor,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Card Start here
                SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (CourseModel.courses.length >= 5)
                          ? 5
                          : CourseModel.courses.length,
                      itemBuilder: (context, index) {
                        return HorizontalCourseWidget(
                          horiCourse: CourseModel.courses[index],
                        );
                      },
                    )),
              ]),
            ),
          ),

          //Gap Between Two Section
          SizedBox(
            height: 10,
          ),
          Container(
            color: AppColors.secondaryBackgroundColor,
            height: 240,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 0, 8),
              child: Column(children: [
                //Section Name And See all button Arear
                Row(
                  children: [
                    //Section Area Name here
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Recently added",
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold),
                        textScaleFactor: 1.5,
                      ),
                    ),
                    //See all Button Here
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 40,
                          width: 100,
                          child: TextButton(
                            onPressed: () {},
                            child: Row(children: [
                              Text(
                                "see all",
                                style: TextStyle(color: AppColors.textColor),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: AppColors.textColor,
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Card Start here
                SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (CourseModel.courses.length >= 5)
                          ? 5
                          : CourseModel.courses.length,
                      itemBuilder: (context, index) {
                        return HorizontalCourseWidget(
                          horiCourse: CourseModel.courses[index],
                        );
                      },
                    )),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
