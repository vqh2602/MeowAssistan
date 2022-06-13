import 'package:equatable/equatable.dart';
import 'package:meowassistan/models/user.dart';

abstract class UserState extends Equatable{
  const UserState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class  UserStateInitial extends  UserState{}
class  UserStateLoading extends  UserState{}
class  UserStateSuccess extends  UserState{
  final UserCustom user;
  const UserStateSuccess({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
class  UserStateFail extends UserState{}