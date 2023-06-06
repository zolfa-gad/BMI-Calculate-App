import 'package:bmi_calculate_app/presentation/widgets/app_bar.dart';
import 'package:bmi_calculate_app/presentation/widgets/gender_button.dart';
import 'package:bmi_calculate_app/presentation/widgets/get_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/route_manger.dart';
import '../../logic/cubit/bmi_calculate_cubit.dart';
import '../widgets/my_button.dart';
import '../widgets/height_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: MyAppBar(
          title: 'BMI Calculation',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<BmiCalculateCubit, BmiCalculateStates>(
                    builder: (context, _) {
                      BmiCalculateCubit bloc =
                          BlocProvider.of<BmiCalculateCubit>(context);
                      return Row(
                        children: [
                          GenderButton(
                            genderType: 'male',
                            color: bloc.maleColor,
                            onPressed: () {
                              bloc.isMale('male');
                            },
                          ),
                          GenderButton(
                            genderType: 'female',
                            color: bloc.femaleColor,
                            onPressed: () {
                              bloc.isMale('female');
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const HeightSlider(),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      GetParameters(type: 'weight'),
                      GetParameters(type: 'age'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: MyButton(
                      text: 'Calculate',
                      onPressed: () {
                        BmiCalculateCubit bloc =
                            BlocProvider.of<BmiCalculateCubit>(context);
                        bloc.getResult();
                        bloc.getHealthResult();
                        Navigator.pushNamed(context, resultScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
