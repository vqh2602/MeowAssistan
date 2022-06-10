
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/events/login_event.dart';
import 'package:meowassistan/repository/userRepository.dart';
import 'package:meowassistan/states/login_state.dart';
import 'package:meowassistan/validators/validators.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  //LoginBloc(LoginState initialState) : super(initialState);
  UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginState.initial())
  {
  on<LoginEventEmailChange>(_onLoginEventEmailChange,transformer: sequential(),);
  on<LoginEventPasswordChange>(_onLoginEventPasswordChange,transformer: sequential(),);
  on<LoginEventWithEmailAndPasswordPressed>(_onLoginEventWithEmailAndPasswordPressed,transformer: sequential(),);


}



  void _onLoginEventEmailChange(
      LoginEventEmailChange event, Emitter emit) async {
      final loginState = state;
      await Future.delayed(Duration(seconds: 1));
      emit(loginState.cloneAndUpdate(isValidEmail: Validators.isValidEmailCheck(email: event.email)));
  }


void _onLoginEventPasswordChange(
    LoginEventPasswordChange event, Emitter emit) async {
  final loginState = state;
  await Future.delayed(Duration(seconds: 1));
  emit(loginState.cloneAndUpdate(isValidEmail: Validators.isValidPasswordCheck(password: event.password)));
}

void _onLoginEventWithEmailAndPasswordPressed(
    LoginEventWithEmailAndPasswordPressed event, Emitter emit) async {
    try{
      await userRepository.signInWithEmailAnPassword(event.email, event.password);
      // print('usser: ${await userRepository.getUser()}');
      await Future.delayed(Duration(seconds: 1));
      emit(LoginState.success());
    }catch(_){
      emit(LoginState.failure());
    }
}
}
