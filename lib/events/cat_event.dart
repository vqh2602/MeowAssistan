import 'package:equatable/equatable.dart';

import '../models/hive_Models/cats.dart';

abstract class CatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// initial event
class CatInitialEvent extends CatEvent {

}
// add event
class CatAddEvent extends CatEvent {
  final Cat cat;

  CatAddEvent({required this.cat});
}
// edit event
class CatEditEvent extends CatEvent {
  final Cat cat;
  final int index;

  CatEditEvent(
      {required this.cat,required this.index});
}
// delete event
class CatDeleteEvent extends CatEvent {
  final int index;

  CatDeleteEvent({required this.index});
}