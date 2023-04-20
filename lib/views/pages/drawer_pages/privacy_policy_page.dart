import 'package:excess_edu/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Privacy Policy", textScaleFactor: 1.5),
            Text("Last updated: 2021-07-01", textScaleFactor: 1),
            Text(
                "Please read these Terms and Conditions carefully before using Our Service.",
                textScaleFactor: 1),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
