import 'package:equatable/equatable.dart';

class LocaleLang extends Equatable {
  String? localeName;
  String? localeId;
  String? localeUrl;

  LocaleLang({this.localeId, this.localeName, this.localeUrl,});

  @override
  // TODO: implement props
  List<Object?> get props => [localeName,localeUrl,localeId];
}
