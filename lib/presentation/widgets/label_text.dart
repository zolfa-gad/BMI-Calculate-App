import 'package:flutter/material.dart';

class LabelTxt extends StatelessWidget {
  const LabelTxt({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.center,
    );
  }
}
