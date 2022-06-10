

import 'package:meta/meta.dart';

@immutable // k thay đổi và k thay đổi trực tiếp
class RegisterState {
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  bool get getValidEmailAndPassword => isValidEmail && isValidPassword;

  const RegisterState(
      {required this.isValidEmail,
        required this.isValidPassword,
        required this.isSubmitting,
        required this.isFailure,
        required this.isSuccess});

  factory RegisterState.initial() {
    return const RegisterState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isFailure: false,
        isSuccess: false);
  }
  factory RegisterState.loadding() {
    return const RegisterState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: true,
        isFailure: false,
        isSuccess: false);
  }
  factory RegisterState.failure() {
    return const RegisterState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isFailure: true,
        isSuccess: false);
  }
  factory RegisterState.success() {
    return const RegisterState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmitting: false,
        isFailure: false,
        isSuccess: true);
  }

  RegisterState cloneWith({
    bool? isValidEmail,
    bool? isValidPassword,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return RegisterState(
        isValidEmail: isValidEmail ??
            this.isValidEmail, // nếu giá trị truyen vao bang null thì lấy giá trị cũ. ??
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure,
        isSuccess: isSuccess ?? this.isSuccess);
  }

  // clone and update
  RegisterState cloneAndUpdate({
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
