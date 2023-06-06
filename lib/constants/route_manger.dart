import 'package:bmi_calculate_app/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/result_page.dart';

const String homeScreen = '/';
const String resultScreen = '/result';

class RouteManager {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case resultScreen:
        return MaterialPageRoute(
          builder: ((context) => const ResultScreen()),
        );

    }
    return null;
  }
}
