import 'package:equatable/equatable.dart';

import '../models/hive_Models/worm.dart';



abstract class WormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// initial event
class WormInitialEvent extends WormEvent {
  int id;
  WormInitialEvent({required this.id});
}
// add event
class WormAddEvent extends WormEvent {
  final Worm bmi;

  WormAddEvent({required this.bmi});
}
// edit event
class WormEditEvent extends WormEvent {
  final Worm bmi;
  final int index;

  WormEditEvent(
      {required this.bmi,required this.index});
}
// delete event
class WormDeleteEvent extends WormEvent {
  final int index;
  int id;

  WormDeleteEvent({required this.index,required this.id});
}