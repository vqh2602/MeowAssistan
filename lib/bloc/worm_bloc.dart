import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/worm_event.dart';
import '../models/hive_Models/database/worm_db.dart';
import '../models/hive_Models/worm.dart';
import '../states/worm_state.dart';





class WormBloc extends Bloc<WormEvent,WormState>{
  final WormDatabase bmiDatabase;
  List<Worm> listBmi = [];

  WormBloc({required this.bmiDatabase}) : super(WormInitial()){
    on<WormInitialEvent>(_onBMIInitialEvent);
    on<WormAddEvent>(_onBMIAddEvent);
    on<WormEditEvent>(_onBMIEditEvent);
    on<WormDeleteEvent>(_onBMIDeleteEvent);
  }

  void _onBMIInitialEvent(
      WormInitialEvent event, Emitter emit) async {
    emit(WormLoading());
    await _getCats(event.id);
    listBmi.sort((a, b) {
      var aDate = a.dayAdd;
      var bDate = b.dayAdd;
      return bDate.compareTo(aDate);
    });
    emit(YourWormState(bmi: listBmi));
  }
  void _onBMIAddEvent(
      WormAddEvent event, Emitter emit) async {
    emit(WormLoading());
    await _addToCats(bmi: event.bmi).whenComplete(() async {
      listBmi.sort((a, b) {
        var aDate = a.dayAdd;
        var bDate = b.dayAdd;
        return bDate.compareTo(aDate);
      });
      emit(YourWormState(bmi: listBmi));
    });
    print('emit aaadd');




  }
  void _onBMIEditEvent(
      WormEditEvent event, Emitter emit) async {
    emit(WormLoading());
    await _updateCat(bmi: event.bmi, index: event.index);
    listBmi.sort((a, b) {
      var aDate = a.dayAdd;
      var bDate = b.dayAdd;
      return bDate.compareTo(aDate);
    });
    emit(YourWormState(bmi: listBmi));
  }
  void _onBMIDeleteEvent(
      WormDeleteEvent event, Emitter emit) async {
    emit(WormLoading());
    await _removeFromNotes(index: event.index, id: event.id );
    listBmi.sort((a, b) {
      var aDate = a.dayAdd;
      var bDate = b.dayAdd;
      return bDate.compareTo(aDate);
    });
    emit(YourWormState(bmi: listBmi));
  }

  // Helper Functions
  Future<void> _getCats(int id) async {
    await bmiDatabase.getFullCat(id).then((value) {
      listBmi = value;
    });
  }


  Future<void> _addToCats({required Worm bmi}) async {
    await bmiDatabase.addToBox(bmi);
    await _getCats(bmi.id);
  }

  Future<void> _updateCat(
      {required int index,required Worm bmi}) async {
    await bmiDatabase.updateCat(
        index, bmi);
    await _getCats(bmi.id);
  }

  Future<void> _removeFromNotes({required int index, required int id}) async {
    await bmiDatabase.deleteFromBox(index);
    await _getCats(id);
  }

}

