import 'package:excess_edu/consts/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../label_widget.dart';

class CourseDescriptionWidget extends StatefulWidget {
  final String description;

  CourseDescriptionWidget({required this.description});

  @override
  State<CourseDescriptionWidget> createState() =>
      _CourseDescriptionWidgetState();
}

class _CourseDescriptionWidgetState extends State<CourseDescriptionWidget> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWidget(text: "Description"),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                widget.description,
                maxLines: _showMore ? null : 6,
                overflow: TextOverflow.fade,
                textScaleFactor: 1.2,
              ),
            ),
            onTap: () {
              setState(() {
                _showMore = !_showMore;
              });
            },
          ),
          (!_showMore)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showMore = true;
                        });
                      },
                      child: Text(
                        "Show More",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showMore = false;
                        });
                      },
                      child: Text(
                        "Show Less",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
