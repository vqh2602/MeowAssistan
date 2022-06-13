import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/events/cat_event.dart';
import 'package:meowassistan/models/hive_Models/database/cat_db.dart';
import 'package:meowassistan/states/cat_state.dart';

import '../models/hive_Models/cats.dart';

class CatBloc extends Bloc<CatEvent,CatState>{
  final CatDatabase catDatabase;
  List<Cat> listCat = [];

  CatBloc({required this.catDatabase}) : super(CatInitial()){
    on<CatInitialEvent>(_onCatInitialEvent);
    on<CatAddEvent>(_onCatAddEvent);
    on<CatEditEvent>(_onCatEditEvent);
    on<CatDeleteEvent>(_onCatDeleteEvent);
  }

  void _onCatInitialEvent(
      CatInitialEvent event, Emitter emit) async {
    await _getCats();
    emit(YourCatState(cat: listCat));
  }
  void _onCatAddEvent(
      CatAddEvent event, Emitter emit) async {
    emit(CatLoading());
    await _addToCats(cat: event.cat).whenComplete(() async {

      emit(YourCatState(cat: listCat));
    });
    print('emit aaadd');




  }
  void _onCatEditEvent(
      CatEditEvent event, Emitter emit) async {
    emit(CatLoading());
    await _updateCat(cat: event.cat, index: event.index);
    emit(YourCatState(cat: listCat));
  }
  void _onCatDeleteEvent(
      CatDeleteEvent event, Emitter emit) async {
    emit(CatLoading());
    await _removeFromNotes(index: event.index);
    listCat.sort((a, b) {
      var aDate = a.name;
      var bDate = b.name;
      return aDate!.compareTo(bDate!);
    });
    emit(YourCatState(cat: listCat));
  }

  // Helper Functions
  Future<void> _getCats() async {
    await catDatabase.getFullCat().then((value) {
      listCat = value.toList();
    });
  }


  Future<void> _addToCats({required Cat cat}) async {
    await catDatabase.addToBox(cat);
    await _getCats();
  }

  Future<void> _updateCat(
      {required int index,required Cat cat}) async {
    await catDatabase.updateCat(
        index, cat);
    await _getCats();
  }

  Future<void> _removeFromNotes({required int index}) async {
    await catDatabase.deleteFromBox(index);
    await _getCats();
  }

}

