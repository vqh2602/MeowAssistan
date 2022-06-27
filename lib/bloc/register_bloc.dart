
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/events/register_event.dart';
import 'package:meowassistan/repository/userRepository.dart';
import 'package:meowassistan/states/register_state.dart';
import 'package:meowassistan/validators/validators.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  //LoginBloc(LoginState initialState) : super(initialState);
  UserRepository? userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterState.initial())
  {
    on<RegisterEventEmailChange>(_onRegisterEventEmailChange,transformer: sequential(),);
    on<RegisterEventPasswordChange>(_onRegisterEventPasswordChange,transformer: sequential(),);
    on<RegisterEventWithEmailAndPasswordPressed>(_onRegisterEventWithEmailAndPasswordPressed,transformer: sequential(),);


  }



  void _onRegisterEventEmailChange(
      RegisterEventEmailChange event, Emitter emit) async {
    //emit(RegisterEventEmailInit());
    final registerState = state;
    await Future.delayed(const Duration(seconds: 1));
    emit(registerState.cloneAndUpdate(isValidEmail: Validators.isValidEmailCheck(email: event.email)));
  }


  void _onRegisterEventPasswordChange(
      RegisterEventPasswordChange event, Emitter emit) async {
    //emit(RegisterEventEmailInit());
    final registerState = state;
    await Future.delayed(const Duration(seconds: 1));
    emit(registerState.cloneAndUpdate(isValidEmail: Validators.isValidPasswordCheck(password: event.password)));
  }

  void _onRegisterEventWithEmailAndPasswordPressed(
      RegisterEventWithEmailAndPasswordPressed event, Emitter emit) async {
    emit(RegisterState.loadding());
    try{
      await userRepository!.createUserWithEmailAndPassword(event.email, event.password);
      await Future.delayed(const Duration(seconds: 1));
      FirebaseFirestore db = FirebaseFirestore.instance;
      final user = <String, dynamic>{
        "displayName": event.displayName,
        "email": event.email,
        "catcoin": 0,
        "expirationDate": DateTime.now()
      };
      // Add a new document with a generated ID
      // db.collection("users").add(user).then((DocumentReference doc) =>
      //     print('DocumentSnapshot added with ID: ${doc.id}'));
      await db
          .collection("users")
          .doc(event.email)
          .set(user)
          .onError((e, _) => print("Error writing document: $e"));

      emit(RegisterState.success());
    }catch(_){

      // await userRepository!.createUserWithEmailAndPassword(event.email, event.password);
      // await Future.delayed(const Duration(seconds: 1));
      // FirebaseFirestore db = FirebaseFirestore.instance;
      // final user = <String, dynamic>{
      //   "displayName": event.displayName,
      //   "email": event.email,
      //   "catcoin": 0,
      //   "expirationDate": DateTime.now()
      // };
      // // Add a new document with a generated ID
      // // db.collection("users").add(user).then((DocumentReference doc) =>
      // //     print('DocumentSnapshot added with ID: ${doc.id}'));
      // db
      //     .collection("users")
      //     .doc(event.email)
      //     .set(user)
      //     .onError((e, _) => print("Error writing document: $e"));

      emit(RegisterState.failure());
    }
  }
}
