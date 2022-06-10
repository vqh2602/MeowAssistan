import 'package:equatable/equatable.dart';

class UserCustom extends Equatable {
  String? displayName;
  String? email;
  num? catcoin;
  DateTime? expirationDate;

  UserCustom({this.displayName, this.email, this.catcoin, this.expirationDate});

  @override
  // TODO: implement props
  List<Object?> get props => [email, displayName, catcoin, expirationDate];
}
