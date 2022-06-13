import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterEventEmailChange extends RegisterEvent{
  final String email;
  RegisterEventEmailChange({required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [email];
  @override
  String toString() {
    // TODO: implement toString
    return "LogninEmailChange: $email";
  }
}

class RegisterEventPasswordChange extends RegisterEvent{
  final String password;
  RegisterEventPasswordChange({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
  @override
  String toString() {
    // TODO: implement toString
    return "LogninPasswordChange: $password";
  }
}

class RegisterEventWithEmailAndPasswordPressed extends RegisterEvent{
  final String email;
  final String password;
  final String displayName;
  RegisterEventWithEmailAndPasswordPressed({required this.email,required this.password, required this.displayName});
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
  @override
  String toString() {
    // TODO: implement toString
    return "LoginEventWithEmailAndPasswordPressed: email: $email pass: $password";
  }
}