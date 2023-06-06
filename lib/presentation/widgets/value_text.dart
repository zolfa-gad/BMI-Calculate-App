import 'package:flutter/material.dart';

class ValueTxt extends StatelessWidget {
  const ValueTxt({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
