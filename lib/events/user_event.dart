import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meowassistan/repository/userRepository.dart';

abstract class UserEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetUser extends UserEvent{
  UserRepository userRepository;
  // final User user;
  GetUser({ required this.userRepository});
}
