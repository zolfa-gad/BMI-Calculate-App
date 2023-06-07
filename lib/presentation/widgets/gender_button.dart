import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    Key? key,
    required this.color,
    required this.genderType,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color color;
  final String genderType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0),
            ),
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  genderType == 'male' ? Icons.male : Icons.female,
                  size: 60,
                  // size: Theme.of(context).primaryIconTheme.size,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  genderType == 'male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
