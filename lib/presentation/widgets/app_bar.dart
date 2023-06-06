import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 25,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ),
      ],
    );
  }
}
