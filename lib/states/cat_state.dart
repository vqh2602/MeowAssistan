import 'package:equatable/equatable.dart';
import 'package:meowassistan/models/hive_Models/cats.dart';

abstract class CatState extends Equatable {
  @override
  List<Object> get props => [];
}

// initial
class  CatInitial extends  CatState {

}

// loading
class  CatLoading extends  CatState {}

// edit notes
class  EditCatState extends  CatState {
  final Cat cat;

  EditCatState({required this.cat});

}
//  your notes
class YourCatState extends  CatState {
  final List<Cat> cat; // get all notes

  YourCatState({required this.cat});

}
// new note
class NewCatState extends  CatState {}