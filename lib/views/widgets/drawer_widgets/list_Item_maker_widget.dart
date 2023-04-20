import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class ListItemMakerWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String routeName;

  ListItemMakerWidget(
      {required this.label, required this.icon, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: Colors.green,
      // highlightColor: Colors.red,
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: 55,
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                label,
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
