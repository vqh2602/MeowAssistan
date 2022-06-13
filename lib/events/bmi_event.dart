import 'package:equatable/equatable.dart';

import '../models/hive_Models/bmi.dart';

abstract class BMIEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// initial event
class BMIInitialEvent extends BMIEvent {
  int id;
  BMIInitialEvent({required this.id});
}
// add event
class BMIAddEvent extends BMIEvent {
  final BMI bmi;

  BMIAddEvent({required this.bmi});
}
// edit event
class BMIEditEvent extends BMIEvent {
  final BMI bmi;
  final int index;

  BMIEditEvent(
      {required this.bmi,required this.index});
}
// delete event
class BMIDeleteEvent extends BMIEvent {
  final int index;
  int id;

  BMIDeleteEvent({required this.index,required this.id});
}