import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/result.dart';


part 'bmi_calculate_state.dart';

class BmiCalculateCubit extends Cubit<BmiCalculateStates> {
  BmiCalculateCubit() : super(BmiCalculateInitialState());

  Color maleColor = Colors.teal;
  Color femaleColor = Colors.grey;
  String genderType = 'Male';

  double height = 170;

  int age = 13;
  int weight = 40;

  double result = 0;
  String health = '';

  isMale(String genderType) {
    if (genderType == 'male') {
      maleColor = Colors.teal;
      femaleColor = Colors.grey;
      this.genderType = genderType.capitalize();
      debugPrint(genderType);
      debugPrint(this.genderType);
      emit(MaleState());
    } else if (genderType == 'female') {
      maleColor = Colors.grey;
      femaleColor = Colors.teal;
      this.genderType = genderType.capitalize();
      debugPrint(genderType);
      debugPrint(this.genderType);
      emit(FemaleState());
    }
  }

  heightSlider(double newHeight) {
    height = newHeight;
    emit(HeightSliderState());
  }

  increaseParameter(String type) {
    if (type == 'age') {
      age++;
      emit(IncreaseState());
    } else if (type == 'weight') {
      weight++;
      emit(IncreaseState());
    }
  }

  decreaseParameter(String type) {
    if (type == 'age') {
      age--;
      emit(DecreaseState());
    } else if (type == 'weight') {
      weight--;
      emit(DecreaseState());
    }
  }

  getResult() {
    result = weight / pow((height / 100), 2);
    emit(ResultState());
  }

  getHealthResult() {
    if (result < 18.5) {
      health = 'Under Weight';
    } else if (result <= 24.9) {
      health = 'Normal';
    } else if (result <= 29.9) {
      health = 'Over Weight';
    } else if (result >= 30) {
      health = 'Obese';
    }

    emit(HealthState());
  }

  String returnAllResults(int index, String type) {
    List<ResultModel> results = [
      ResultModel(label: 'Result:', value: result.toStringAsFixed(2)),
      ResultModel(label: 'Weight:', value: weight.toString()),
      ResultModel(label: 'Height:', value: height.toStringAsFixed(2)),
      ResultModel(label: 'Age:', value: age.toString()),
      ResultModel(label: 'Gender:', value: genderType.toString()),
      ResultModel(label: 'Healthiness:', value: health.toString()),
    ];
    return type == 'label' ? results[index].label : results[index].value;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
