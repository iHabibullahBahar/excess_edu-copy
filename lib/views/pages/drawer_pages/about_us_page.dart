import 'package:excess_edu/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            //Write A About Us Page Here . Excess Edu is A Online Education Platform
            Text(
              "About Us",
              textScaleFactor: 1.5,
            ),


          ],
        ),
      ),
    );
  }
}
