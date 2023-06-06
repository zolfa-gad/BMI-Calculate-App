import 'package:bmi_calculate_app/constants/route_manger.dart';
import 'package:bmi_calculate_app/logic/cubit/bmi_calculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(appRouter: RouteManager()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  static var themeColor = Colors.teal;
  final RouteManager appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCalculateCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: themeColor,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            labelMedium: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
      
          primaryIconTheme: const IconThemeData(
            color: Colors.white,
            size: 50,
          ),
          canvasColor: themeColor.withOpacity(0.3),
        ),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
