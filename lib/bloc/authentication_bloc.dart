
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/events/authencation_event.dart';
import 'package:meowassistan/repository/userRepository.dart';
import 'package:meowassistan/states/authencation_state.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // AuthenticationBloc(initialState) : super(initialState);
  final UserRepository userRepository;
  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationStateInitial()) {
    on<AuthenticationEventStarted>(_onAuthenticationEventStarted);
    on<AuthenticationEventLogin>(_onAuthenticationEventLogin);
    on<AuthenticationEventLogout>(_onAuthenticationEventLogout);
  }

  void _onAuthenticationEventStarted(
      AuthenticationEventStarted event, Emitter emit) async {
    emit(AuthenticationStateInitial());
    final isSignedIn = await userRepository.isSignIn();
    if (isSignedIn) {
      User? user = await userRepository.getUser();
      emit(AuthenticationStateSuccess(user: user));
    } else {
      emit(AuthenticationStateFailure());
    }
  }

  void _onAuthenticationEventLogin(
      AuthenticationEventLogin event, Emitter emit) async {
    emit(AuthenticationStateInitial());
    User? user = await userRepository.getUser();
    emit(AuthenticationStateSuccess(user: user));
  }

  void _onAuthenticationEventLogout(
      AuthenticationEventLogout event, Emitter emit) async {
    emit(AuthenticationStateInitial());
    userRepository.signOut();
    emit(AuthenticationStateFailure());
  }
}
