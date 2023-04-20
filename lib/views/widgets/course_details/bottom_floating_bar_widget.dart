import 'dart:ui';

import 'package:excess_edu/consts/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String currency;
  final double price;
  final VoidCallback onEnrollPressed;

  BottomBar({
    required this.currency,
    required this.price,
    required this.onEnrollPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "$currency $price",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ElevatedButton(
              onPressed: onEnrollPressed,
              child: Text('Enroll'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(120, 45),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
