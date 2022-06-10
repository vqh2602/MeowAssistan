import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meowassistan/data/dataCatEmoij.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Color/colors.dart';

class CatEmojiScreen extends StatefulWidget {
  bool vip;
  CatEmojiScreen({Key? key, required this.vip}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyCatEmojiScreen();
  }
}

class _MyCatEmojiScreen extends State<CatEmojiScreen>{
  List<CatEmoji> lstCatMoji = ListCatEmoji;
  AudioPlayer audioPlayer = AudioPlayer();
  //
  final AudioCache _audioCache = AudioCache(
    prefix: 'acssets/musics/catEmojiMusic/',
    fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioCache.fixedPlayer?.stop();
    print('thoat trang');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    Image.asset('acssets/images/cats/catEmoij.png', fit: BoxFit.cover,width: double.infinity,),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('Thể Hiện cảm xúc ',style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ))
                  ],
                )),
            Expanded(
                flex: 9,
                child:        Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child:GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      children: List.generate(lstCatMoji.length, (index) {
                        return Center(
                          child: InkWell(
                            onTap: () {
                              // playLocal(lstCatMoji[index].voiceUrl);
                              // _audioCache.play(lstCatMoji[index].voiceUrl);
                              if( lstCatMoji[index].vip){
                                widget.vip?_audioCache.play(lstCatMoji[index].voiceUrl):showAlertVip(context);
                              }else{
                                _audioCache.play(lstCatMoji[index].voiceUrl);
                              }


                            },
                            child: Card(
                                color: Colors.white,
                                shadowColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Expanded(child: Icon(choice.icon, size:50.0, color: textStyle.color)),
                                        Image.asset(
                                            'acssets/images/catEmoji/${lstCatMoji[index].imageUrl}'),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                '${lstCatMoji[index].title} ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: colorPinkFf758c()),
                                              ),
                                              lstCatMoji[index].vip
                                                  ? WidgetSpan(
                                                child: Image.asset(
                                                  'acssets/images/catEmoji/crown.png',
                                                  width: 20,
                                                ),
                                              )
                                                  : WidgetSpan(
                                                child: Image.asset(
                                                  'acssets/images/catEmoji/free.png',
                                                  width: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Text(lstCatMoji[index].title,),
                                      ]),
                                )),
                          ),
                        );
                      })) ,
                ),


                )
          ],
        )



      ),
    );
  }

  void showAlertVip(BuildContext context){


    Alert(
      context: context,
      // style: alertStyle,
      // type: AlertType.info,
      title: "Thông Báo",
      desc: "Bạn chưa đăng kí dịch vụ, vui lòng vào trang tài khoản để gia hạn dịch vụ. \n Bạn có thể nhận xu miễn phí tại vòng quay",
      image: Image.asset("acssets/images/catEmoji/crown.png"),
      buttons: [
        DialogButton(
          gradient: LinearGradient(colors: [
            colorPinkFf758c(),
            colorPinkFf7eb3()
          ]),
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20,),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(50.0),
        ),
      ],
    ).show();
  }

}

// class SelectCard extends StatelessWidget {
//   const SelectCard({Key? key, this.choice}) : super(key: key);
//   final Choice choice;
//
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return Card(
//         color: Colors.orange,
//         child: Center(child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Expanded(child: Icon(choice.icon, size:50.0, color: textStyle.color)),
//               Text(choice.title, style: textStyle),
//             ]
//         ),
//         )
//     );
//   }
// }
