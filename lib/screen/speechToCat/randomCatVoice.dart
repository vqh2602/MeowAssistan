
// tách chuỗi đếm có bao nhiêu từ
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';

import '../../data/dataCatVoice.dart';

int woldCount(String str){
  return str.split(' ').length;
}

// lặp, có bao nhiêu từ lặp bính nhiêu lần, mỗi lần lặp random 1 âm thanh khác nhau và trả về 1 list url âm thanh

List<Audio> randomCatVoice( int woldcount){

  final assets = <Audio>[];
  for(int i=0;i<woldcount;i++){
        assets.add( Audio('acssets/musics/catTran/${listCatVoice[Random().nextInt(listCatVoice.length)]}'));
  }
  // print(assets.toString());
  return assets;
}
