import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/vaccine_event.dart';
import '../models/hive_Models/database/vaccine_db.dart';
import '../models/hive_Models/vaccine.dart';
import '../states/vaccine_state.dart';



class VaccineBloc extends Bloc<VaccineEvent,VaccineState>{
  final VaccineDatabase bmiDatabase;
  List<Vaccine> listBmi = [];

  VaccineBloc({required this.bmiDatabase}) : super(VaccineInitial()){
    on<VaccineInitialEvent>(_onBMIInitialEvent);
    on<VaccineAddEvent>(_onBMIAddEvent);
    on<VaccineEditEvent>(_onBMIEditEvent);
    on<VaccineDeleteEvent>(_onBMIDeleteEvent);
  }

  void _onBMIInitialEvent(
      VaccineInitialEvent event, Emitter emit) async {
    emit(VaccineLoading());
    await _getCats(event.id);
    listBmi.sort((a, b) {
      var aDate = a.dayAdd;
      var bDate = b.dayAdd;
      return bDate.compareTo(aDate);
    });
    emit(YourVaccineState(bmi: listBmi));
  }
  void _onBMIAddEvent(
      VaccineAddEvent event, Emitter emit) async {
    emit(VaccineLoading());
    await _addToCats(bmi: event.bmi).whenComplete(() async {
      listBmi.sort((a, b) {
        var aDate = a.dayAdd;
        var bDate = b.dayAdd;
        return bDate.compareTo(aDate);
      });
      emit(YourVaccineState(bmi: listBmi));
    });
    print('emit aaadd');




  }
  void _onBMIEditEvent(
      VaccineEditEvent event, Emitter emit) async {
    emit(VaccineLoading());
    await _updateCat(bmi: event.bmi, index: event.index);
    listBmi.sort((a, b) {
      var aDate = a.dayAdd;
      var bDate = b.dayAdd;
      return bDate.compareTo(aDate);
    });
    emit(YourVaccineState(bmi: listBmi));
  }
  void _onBMIDeleteEvent(
      VaccineDeleteEvent event, Emitter emit) async {
    emit(VaccineLoading());
    await _removeFromNotes(index: event.index, id: event.id );
    listBmi.sort((a, b) {
      var aDate = a.dayAdd;
      var bDate = b.dayAdd;
      return aDate.compareTo(bDate);
    });
    emit(YourVaccineState(bmi: listBmi));
  }

  // Helper Functions
  Future<void> _getCats(int id) async {
    await bmiDatabase.getFullCat(id).then((value) {
      listBmi = value;
    });
  }


  Future<void> _addToCats({required Vaccine bmi}) async {
    await bmiDatabase.addToBox(bmi);
    await _getCats(bmi.id);
  }

  Future<void> _updateCat(
      {required int index,required Vaccine bmi}) async {
    await bmiDatabase.updateCat(
        index, bmi);
    await _getCats(bmi.id);
  }

  Future<void> _removeFromNotes({required int index, required int id}) async {
    await bmiDatabase.deleteFromBox(index);
    await _getCats(id);
  }

}

