import 'package:excess_edu/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class PaymentAndOrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
            child: Text(
          "You Have No Payment History Yet",
          textScaleFactor: 1.5,
        )),
      ),
    );
  }
}
