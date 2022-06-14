import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meowassistan/Color/colors.dart';
import 'package:meowassistan/bloc/user_bloc.dart';
import 'package:meowassistan/screen/catEmoij/catEmoijScreen.dart';
import 'package:meowassistan/screen/healCat/catScreen.dart';
import 'package:meowassistan/screen/speechToCat/speechToCat.dart';
import 'package:meowassistan/screen/utilities/utilitiesScreen.dart';
import 'package:meowassistan/states/user_state.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../events/user_event.dart';
import '../../repository/userRepository.dart';

class HomeControlScreen extends StatefulWidget {
  UserRepository userRepository;

  HomeControlScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyHomeControlScreen();
  }
}

class _MyHomeControlScreen extends State<HomeControlScreen> {
  UserRepository? get userRepository => widget.userRepository;
  late UserBloc _userBloc;
  late BannerAd _bannerAd;

  TextStyle styleTitle() {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dashed,
      color: colorPinkFf758c(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(GetUser(userRepository: userRepository!));

    // ad banner
    _bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
        // onApplicationExit: (Ad ad) => print('$BannerAd onApplicationExit.'),
      ),
    );

    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: _bannerAd);

    Widget _body(String name, bool vip) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // avatar
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, $name',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                    const CircleAvatar(
                      radius: 40, // Image radius
                      backgroundImage:
                          AssetImage('acssets/images/cats/catAvatar.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.topCenter,
              child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: adWidget,
                    width: _bannerAd.size.width.toDouble(),
                    height: _bannerAd.size.height.toDouble(),
                  )),
            ),
            // guao tiep
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text(
                      'Giao Tiếp Meow',
                      style: styleTitle(),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 0,
                        child:
                            Image.asset('acssets/images/cats/homeCatEmoij.png'),
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: CatEmojiScreen(
                                        vip: vip,
                                      )));
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => CatEmojiScreen(vip: vip,)),
                              // );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 20, top: 5),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Thể hiện cảm xúc',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'phát những âm thanh mèo',
                                        style: TextStyle(
                                            color: colorB3B3B3(), fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 20),
                                    child: Icon(
                                      Icons.arrow_circle_right_outlined,
                                      size: 40,
                                      color: colorPinkFf758c(),
                                    )),
                              ],
                            ),
                          ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: SpeechToCatScreen(
                                        vip: vip,
                                      )));
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => SpeechToCatScreen(vip: vip,)),
                              // );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 0, top: 5),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Phiên dịch',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'phiên dịch âm thanh của bạn thành tiếng mèo kêu',
                                        style: TextStyle(
                                            color: colorB3B3B3(), fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 20),
                                    child: Icon(
                                        Icons.arrow_circle_left_outlined,
                                        size: 40,
                                        color: colorPinkFf7eb3())),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 0,
                        child:
                            Image.asset('acssets/images/cats/homeCatTrans.png'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // bac si
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 20),
                      child: Text(
                        'Sức khoẻ meow',
                        style: styleTitle(),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Image.asset('acssets/images/cats/homeCatBMI.png'),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const CatScreen()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 50, top: 5),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    'BMI',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'tính chỉ số BMI',
                                    style: TextStyle(
                                        color: colorDFDFDF(), fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(left: 10, right: 20),
                                child: Icon(Icons.arrow_circle_right_outlined,
                                    size: 40, color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Image.asset('acssets/images/cats/homeCatDoctor.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 50, top: 5),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Bác sĩ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'phán đoán bệnh',
                                  style: TextStyle(
                                      color: colorDFDFDF(), fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(left: 10, right: 20),
                              child: Icon(Icons.arrow_circle_right_outlined,
                                  size: 40, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Image.asset('acssets/images/cats/homeCatFollow.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 50, top: 5),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Sổ sức khoẻ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'sổ theo dõi',
                                  style: TextStyle(
                                      color: colorDFDFDF(), fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(left: 10, right: 20),
                              child: Icon(Icons.arrow_circle_right_outlined,
                                  size: 40, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ),

            // tien ich
            SizedBox(
              width: double.infinity,
              child: Column(
                children:<Widget> [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 30, top: 20),
                      child: Text(
                        'Tiện ích meow',
                        style: styleTitle(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return UtilitiesScreen(vip: vip,);
                          }));
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Align(
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              // padding: EdgeInsets.only(left: 20,right: 20),
                              margin: EdgeInsets.only(left: 20,right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.1, 0.9],
                                  colors: [colorPinkFf758c(), colorPinkFf7eb3()],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 40),
                              child: Text('Danh sách các tiện ích',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter'
                              ),),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                'acssets/images/cats/homeCatEx.png',
                                width: 150,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    // TODO: implement build
    // throw UnimplementedError();
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          if (userState is UserStateFail) {
            print('login fail');
            return Container();
          } else if (userState is UserStateSuccess) {
            print('login submit');
            return _body(userState.user.displayName!,
                checkVip(userState.user.expirationDate!));
          } else {
            return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                colorPinkFf758c(),
              )),
            );
          }
        },
      ),
    ));
  }

  bool checkVip(DateTime dateTimeUser) {
    DateTime now = DateTime.now();
    print('check ngay con dich vu: ${dateTimeUser.isAfter(now)}');
    return dateTimeUser.isAfter(now);
  }
}
