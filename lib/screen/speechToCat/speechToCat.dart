import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

import 'package:meowassistan/screen/speechToCat/randomCatVoice.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../Color/colors.dart';

class SpeechToCatScreen extends StatefulWidget {
  SpeechToCatScreen({Key? key, required this.vip}) : super(key: key);
  bool vip;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MySpeechToCatScreen();
  }
}

class _MySpeechToCatScreen extends State<SpeechToCatScreen> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  List<Audio> lstAudio = [];
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool stateCat = false;

  // final AudioCache _audioCache = AudioCache(
  //    prefix: 'acssets/musics/catEmojiMusic/',
  //     fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP)
  //  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSpeech();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    assetsAudioPlayer.pause();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  Future<void> _onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      _lastWords = result.recognizedWords;
      print('${result.recognizedWords} - ${result.finalResult}');
    });

    if (result.finalResult) {
      setState(() {
        stateCat = true;
      });
      lstAudio = randomCatVoice(woldCount(_lastWords));
      //   _audioCache.play(lstAudio[0]);
      assetsAudioPlayer.open(Playlist(audios: lstAudio),
          loopMode: LoopMode.none //loop the full playlist
          );

      assetsAudioPlayer.playlistAudioFinished.listen((Playing playing) {
        if (playing.index == lstAudio.length - 1) {
          setState(() {
            stateCat = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: widget.vip
            ? Column(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          Image.asset(
                            'acssets/images/cats/catTran.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          const Text('Phiên dịch ',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      )),
                  Expanded(
                      flex: 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.info_outline),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          Container(
                              color: Colors.white,
                              width: double.infinity,
                              child: InkWell(
                                onTap: _speechToText.isNotListening
                                    ? _startListening
                                    : _stopListening,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (Widget child,
                                      Animation<double> animation) {
                                    return ScaleTransition(
                                        scale: animation, child: child);
                                  },
                                  child: !stateCat
                                      ? Lottie.asset(
                                          'acssets/iconAnimation/lineVoice.json',
                                          animate:
                                              !_speechToText.isNotListening,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                          key: ValueKey(stateCat),
                                          // frameRate: FrameRate(3.5)
                                        )
                                      : Lottie.asset(
                                          'acssets/iconAnimation/catRun.json',
                                          animate: true,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                          key: ValueKey(stateCat),
                                          // frameRate: FrameRate(3.5)
                                        ),
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: colorF6F6F6(),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Ionicons.accessibility_outline,
                                  size: 70,
                                  color: colorPinkFf758c(),
                                ),
                                const Icon(
                                  Ionicons.code_outline,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Ionicons.logo_octocat,
                                  size: 70,
                                  color: colorPinkFf7eb3(),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ))
                ],
              )
            : const Center(
                child: Text(
                    'Bạn chưa đăng kí dịch vụ, vào vòng quay để kiếm thêm catcoin, vào trang tài khoản để gia hạn dịch vụ'),
              ),
      ),
    );
  }

  // This is called each time the users wants to start a new speech
  // recognition session

}
