import 'package:equatable/equatable.dart';

class UserCustom extends Equatable {
  String? displayName;
  String? email;
  num? catcoin;
  DateTime? expirationDate;
  DateTime? adToday;
  int? adLimited;

  UserCustom({this.displayName, this.email, this.catcoin, this.expirationDate,this.adToday,this.adLimited});

  @override
  // TODO: implement props
  List<Object?> get props => [email, displayName, catcoin, expirationDate,adToday,adLimited];
}
