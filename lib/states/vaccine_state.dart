import 'package:equatable/equatable.dart';

import '../models/hive_Models/vaccine.dart';

abstract class VaccineState extends Equatable {
  @override
  List<Object> get props => [];
}

// initial
class  VaccineInitial extends  VaccineState {

}

// loading
class  VaccineLoading extends  VaccineState {}

// edit notes
class  EditVaccineState extends  VaccineState {
  final Vaccine bmi;

  EditVaccineState({required this.bmi});

}
//  your notes
class YourVaccineState extends VaccineState {
  final List<Vaccine> bmi; // get all notes

  YourVaccineState({required this.bmi});

}
// new note
class NewVaccineState extends  VaccineState {}