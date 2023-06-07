import 'package:bmi_calculate_app/logic/cubit/bmi_calculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetParameters extends StatelessWidget {
  const GetParameters({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCalculateCubit, BmiCalculateStates>(
      builder: (context, state) {
        BmiCalculateCubit bloc = BlocProvider.of<BmiCalculateCubit>(context);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    type == 'weight' ? 'Weight' : 'Age',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    type == 'weight'
                        ? bloc.weight.toString()
                        : bloc.age.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          bloc.increaseParameter(type);
                        },
                        heroTag: type == 'weight' ? 'weight++' : 'age++',
                        mini: true,
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          bloc.decreaseParameter(type);
                        },
                        heroTag: type == 'weight' ? 'weight--' : 'age--',
                        mini: true,
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
