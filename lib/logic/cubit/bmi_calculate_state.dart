part of 'bmi_calculate_cubit.dart';

@immutable
abstract class BmiCalculateStates {}

class BmiCalculateInitialState extends BmiCalculateStates {}

class MaleState extends BmiCalculateStates {}

class FemaleState extends BmiCalculateStates {}

class HeightSliderState extends BmiCalculateStates {}

class IncreaseState extends BmiCalculateStates {}

class DecreaseState extends BmiCalculateStates {}

class ResultState extends BmiCalculateStates {}

class HealthState extends BmiCalculateStates {}
