import 'package:excess_edu/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class TermsAndConditionPage extends StatelessWidget {
  const TermsAndConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Terms and Conditions",
              textScaleFactor: 1.5,
            ),
            Text(
              "Last updated: 2021-07-01",
              textScaleFactor: 1,
            ),
            Text(
              "Please read these Terms and Conditions carefully before using Our Service.",
              textScaleFactor: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Interpretation and Definitions",
              textScaleFactor: 1.5,
            ),
            Text(
              "Interpretation",
              textScaleFactor: 1.5,
            ),
            Text(
              "The words of which the initial letter is capitalized have meanings defined under the following conditions.",
              textScaleFactor: 1,
            ),
            Text(
              "The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.",
              textScaleFactor: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Definitions",
              textScaleFactor: 1.5,
            ),
            Text(
              "For the purposes of these Terms and Conditions:",
              textScaleFactor: 1,
            ),
            Text(
              "Affiliate means an entity that controls, is controlled by or is under common control with a party, where control means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.",
              textScaleFactor: 1,
            ),
            Text(
              "Country refers to: Bangladesh",
              textScaleFactor: 1,
            ),
            Text(
              "Company (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Excess Edu.",
              textScaleFactor: 1,
            ),
            Text(
              "Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.",
              textScaleFactor: 1,
            ),
            Text(
              "Service refers to the Website.",
              textScaleFactor: 1,
            ),
            Text(
              "Terms and Conditions (also referred as \"Terms\") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service.",
              textScaleFactor: 1,
            ),
            Text(
              "Third-party Social Media Service means any services or content (including data, information, products or services) provided by a third-party that",
            ),
          ],
        ),
      ),
    );
  }
}
