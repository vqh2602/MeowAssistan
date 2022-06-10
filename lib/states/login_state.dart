

import 'package:meta/meta.dart';

@immutable // k thay đổi và k thay đổi trực tiếp
class LoginState {
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool get getValidEmailAndPassword => isValidEmail && isValidPassword;

  const LoginState(
      {required this.isValidEmail,
      required this.isValidPassword,
      required this.isSubmitting,
      required this.isFailure,
      required this.isSuccess});

  factory LoginState.initial() {
    return const LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isFailure: false,
        isSuccess: false);
  }
  factory LoginState.loadding() {
    return const LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: true,
        isFailure: false,
        isSuccess: false);
  }
  factory LoginState.failure() {
    return const LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isFailure: true,
        isSuccess: false);
  }
  factory LoginState.success() {
    return const LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isFailure: false,
        isSuccess: true);
  }

  // clone
  LoginState cloneWith({
     bool? isValidEmail,
     bool? isValidPassword,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginState(
        isValidEmail: isValidEmail ??
            this.isValidEmail, // nếu giá trị truyen vao bang null thì lấy giá trị cũ. ??
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure,
        isSuccess: isSuccess ?? this.isSuccess);
  }

  // clone and update
  LoginState cloneAndUpdate({
     bool? isValidEmail,
     bool? isValidPassword,
  }) {
    return cloneWith(
        isValidEmail: isValidEmail,
        isValidPassword: isValidPassword,
        isSubmitting: false,
        isFailure: false,
        isSuccess: false);
  }

}
