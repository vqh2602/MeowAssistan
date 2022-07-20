import 'package:equatable/equatable.dart';

import '../models/hive_Models/vaccine.dart';



abstract class VaccineEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// initial event
class VaccineInitialEvent extends VaccineEvent {
  int id;
  VaccineInitialEvent({required this.id});
}
// add event
class VaccineAddEvent extends VaccineEvent {
  final Vaccine bmi;

  VaccineAddEvent({required this.bmi});
}
// edit event
class VaccineEditEvent extends VaccineEvent {
  final Vaccine bmi;
  final int index;

  VaccineEditEvent(
      {required this.bmi,required this.index});
}
// delete event
class VaccineDeleteEvent extends VaccineEvent {
  final int index;
  int id;

  VaccineDeleteEvent({required this.index,required this.id});
}