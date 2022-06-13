import 'package:equatable/equatable.dart';

import '../models/hive_Models/bmi.dart';

abstract class BMIState extends Equatable {
  @override
  List<Object> get props => [];
}

// initial
class  BMIInitial extends  BMIState {

}

// loading
class  BMILoading extends  BMIState {}

// edit notes
class  EditBMIState extends  BMIState {
  final BMI bmi;

  EditBMIState({required this.bmi});

}
//  your notes
class YourBMIState extends BMIState {
  final List<BMI> bmi; // get all notes

  YourBMIState({required this.bmi});

}
// new note
class NewCatState extends  BMIState {}