import 'package:flutter/cupertino.dart';

class LabelWidget extends StatelessWidget {
  final String text;

  const LabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1.5,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
