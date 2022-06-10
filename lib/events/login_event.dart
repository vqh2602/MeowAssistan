import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginEventEmailChange extends LoginEvent{
  final String email;
  LoginEventEmailChange({required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [email];
  @override
  String toString() {
    // TODO: implement toString
    return "LogninEmailChange: ${email}";
  }
}

class LoginEventPasswordChange extends LoginEvent{
  final String password;
  LoginEventPasswordChange({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
  @override
  String toString() {
    // TODO: implement toString
    return "LogninPasswordChange: ${password}";
  }
}

class LoginEventWithEmailAndPasswordPressed extends LoginEvent{
  final String email;
  final String password;
  LoginEventWithEmailAndPasswordPressed({required this.email,required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
  @override
  String toString() {
    // TODO: implement toString
    return "LoginEventWithEmailAndPasswordPressed: email: $email pass: $password";
  }
}