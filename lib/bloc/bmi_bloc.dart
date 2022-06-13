import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/bmi_event.dart';
import '../models/hive_Models/bmi.dart';
import '../models/hive_Models/database/bmi_db.dart';
import '../states/bmi_state.dart';

class BMIBloc extends Bloc<BMIEvent,BMIState>{
  final BMIDatabase bmiDatabase;
  List<BMI> listBmi = [];

  BMIBloc({required this.bmiDatabase}) : super(BMIInitial()){
    on<BMIInitialEvent>(_onBMIInitialEvent);
    on<BMIAddEvent>(_onBMIAddEvent);
    on<BMIEditEvent>(_onBMIEditEvent);
    on<BMIDeleteEvent>(_onBMIDeleteEvent);
  }

  void _onBMIInitialEvent(
      BMIInitialEvent event, Emitter emit) async {
    emit(BMILoading());
    await _getCats(event.id);
    emit(YourBMIState(bmi: listBmi));
  }
  void _onBMIAddEvent(
      BMIAddEvent event, Emitter emit) async {
    emit(BMILoading());
    await _addToCats(bmi: event.bmi).whenComplete(() async {
      listBmi.sort((a, b) {
        var aDate = a.dayAdd;
        var bDate = b.dayAdd;
        return aDate.compareTo(bDate);
      });
      emit(YourBMIState(bmi: listBmi));
    });
    print('emit aaadd');




  }
  void _onBMIEditEvent(
      BMIEditEvent event, Emitter emit) async {
    emit(BMILoading());
    await _updateCat(bmi: event.bmi, index: event.index);
    emit(YourBMIState(bmi: listBmi));
  }
  void _onBMIDeleteEvent(
      BMIDeleteEvent event, Emitter emit) async {
    emit(BMILoading());
    await _removeFromNotes(index: event.index, id: event.id );
    listBmi.sort((a, b) {
      var aDate = a.dayAdd;
      var bDate = b.dayAdd;
      return aDate.compareTo(bDate);
    });
    emit(YourBMIState(bmi: listBmi));
  }

  // Helper Functions
  Future<void> _getCats(int id) async {
    await bmiDatabase.getFullCat(id).then((value) {
      listBmi = value;
    });
  }


  Future<void> _addToCats({required BMI bmi}) async {
    await bmiDatabase.addToBox(bmi);
    await _getCats(bmi.id);
  }

  Future<void> _updateCat(
      {required int index,required BMI bmi}) async {
    await bmiDatabase.updateCat(
        index, bmi);
    await _getCats(bmi.id);
  }

  Future<void> _removeFromNotes({required int index, required int id}) async {
    await bmiDatabase.deleteFromBox(index);
    await _getCats(id);
  }

}

