import 'package:bmi_calculate_app/presentation/widgets/app_bar.dart';
import 'package:bmi_calculate_app/presentation/widgets/my_button.dart';
import 'package:bmi_calculate_app/presentation/widgets/label_text.dart';
import 'package:bmi_calculate_app/presentation/widgets/value_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/bmi_calculate_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  final int itemsLength = 6;

  @override
  Widget build(BuildContext context) {
    BmiCalculateCubit bloc = BlocProvider.of<BmiCalculateCubit>(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: MyAppBar(
          title: 'Result',
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            // color: Colors.black.withOpacity(0.9),
            // border: Border.all(
            //   color: Colors.white,
            //   width: 3,
            // ),
            gradient: const LinearGradient(
              colors: [
                Colors.teal,
                Colors.orangeAccent,
                // Colors.teal,
                // Colors.teal,
                // Colors.amberAccent,
                // Colors.orangeAccent,
                // Colors.amberAccent,
                // Colors.teal,
                // Colors.green,
                // Colors.lightGreen,
                // Colors.orange,
                // Colors.yellow,
                // Colors.lightGreen,
                // Colors.green,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 10,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: itemsLength,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            index != itemsLength - 1
                                ? Expanded(
                                    child: LabelTxt(
                                      text: bloc.returnAllResults(
                                        index,
                                        'label',
                                      ),
                                    ),
                                  )
                                : LabelTxt(
                                    text: bloc.returnAllResults(
                                      5,
                                      'label',
                                    ),
                                  ),
                            ValueTxt(
                              text: bloc.returnAllResults(
                                index,
                                'value',
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: ((context, index) {
                        return const SizedBox(
                          height: 31,
                        );
                      }),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  MyButton(
                    text: 'Ok',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
