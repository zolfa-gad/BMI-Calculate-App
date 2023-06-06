import 'package:bmi_calculate_app/logic/cubit/bmi_calculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCalculateCubit, BmiCalculateStates>(
      builder: (context, _) {
        BmiCalculateCubit bloc = BlocProvider.of<BmiCalculateCubit>(context);
        return Container(
          width: double.infinity,
          // height: 100,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    bloc.height.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'CM',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Slider(
                value: bloc.height,
                min: 40,
                max: 200,
                onChanged: (val) {
                  bloc.heightSlider(val);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
