import 'package:excess_edu/consts/sizes.dart';
import 'package:excess_edu/models/course_model.dart';
import 'package:excess_edu/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';

import '../../consts/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/course_widget.dart';

class AllCourcesPage extends StatefulWidget {
  const AllCourcesPage({super.key});

  @override
  State<AllCourcesPage> createState() => _AllCourcesPageState();
}

class _AllCourcesPageState extends State<AllCourcesPage> {
  bool _isMounted = false;
  double padding = AppsSizeConfigs.defaultPadding;

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
    return Scaffold(
      appBar: CustomAppBar(),
      body: (CourseModel.courses != null && CourseModel.courses.isNotEmpty)
          ? ListView.builder(
              itemCount: CourseModel.courses.length,
              itemBuilder: (context, index) {
                return CourseWidget(
                  course: CourseModel.courses[index],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            )),
      drawer: MyDrawer(),
    );
  }
}
