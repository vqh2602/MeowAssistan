import 'package:equatable/equatable.dart';

import '../models/hive_Models/worm.dart';



abstract class WormState extends Equatable {
  @override
  List<Object> get props => [];
}

// initial
class   WormInitial extends  WormState {

}

// loading
class   WormLoading extends   WormState {}

// edit notes
class  EditWormState extends WormState {
  final Worm bmi;

  EditWormState({required this.bmi});

}
//  your notes
class YourWormState extends WormState {
  final List<Worm> bmi; // get all notes

  YourWormState({required this.bmi});

}
// new note
class NewWormState extends WormState {}