import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meowassistan/screen/utilities/calculatorAgeCat.dart';
import 'package:meowassistan/screen/utilities/catBenadrylCalculator.dart';
import 'package:meowassistan/screen/utilities/catCalorieCalculator.dart';
import 'package:meowassistan/screen/utilities/catPregnancyCalculator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../Color/colors.dart';
import '../../admod/admod.dart';

class UtilitiesScreen extends StatelessWidget {
  bool vip;

  List<String> lstUtilities = [
    'tinh_tuoi_meo'.tr(),
    'tinh_b'.tr(),
    'tinh_calo'.tr(),
    'tinh_mang_thai'.tr()
  ];

  UtilitiesScreen({Key? key, required this.vip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: colorPinkFf758c(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Align(
                        child: Container(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'tien_ich_tt',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Colors.white),
                      ).tr(),
                      alignment: Alignment.topLeft,
                    )),
                    Align(
                        child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'tien_ich_des',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Colors.white),
                      ).tr(),
                      alignment: Alignment.topLeft,
                    ))
                  ],
                )),
            Expanded(
                flex: 10,
                child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: const BouncingScrollPhysics(),
                    itemCount: lstUtilities.length,
                    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 1,
                    //   // childAspectRatio: 0.72,
                    //   // mainAxisSpacing: 10,
                    //   // crossAxisSpacing: 10,
                    // ),

                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            showInterstitialAd();
                            pushPage(index, context);
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (BuildContext context) {
                            //       return BMIScreen(
                            //         id: note.id!,
                            //       );
                            //     }));

                            // CatDatabase cattt = CatDatabase();
                            // cattt.truyvan(note.id!);
                          },
                          onDoubleTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (BuildContext context) {
                            //       return EditCatScreen(
                            //         cat: note,
                            //         index: index,
                            //         newNote: false,
                            //       );
                            //     }));
                          },
                          onLongPress: () {},
                          child: utilitiesCard(index, lstUtilities[index]),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Widget utilitiesCard(int index, String title) {
    return (index % 2 == 0) ? leftCard(index, title) : rightCard(index, title);
  }

  void pushPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: CalculatorAgeCat()));
        break;
      case 1:
        {
          if (vip) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: CatBenadrylCalculator()));
          } else {
            showAlertVip(context);
          }
        }
        break;
      case 2:
        {
          if (vip) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: CatCalorieCalculator()));
          } else {
            showAlertVip(context);
          }
        }
        break;
      case 3:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                child: CatPregnancyCalculator()));
        break;
    }
  }

  Widget leftCard(int index, String title) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            height: 170,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        colors: [Colors.white, colorF6F6F6()],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20.w),
                    child: Text(
                      '$title',
                      style: TextStyle(
                          fontSize: 11.5.sp,
                          color: colorPinkFf758c(),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'acssets/images/cats/utili${index + 1}.png',
                      width: 130,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget rightCard(int index, String title) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 170,
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    // padding: EdgeInsets.only(left: 20,right: 20),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        colors: [Colors.white, colorF6F6F6()],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text(
                      '$title',
                      style: TextStyle(
                          fontSize: 11.5.sp,
                          color: colorPinkFf758c(),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'acssets/images/cats/utili${index + 1}.png',
                      width: 130,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAlertVip(BuildContext context) {
    Alert(
      context: context,
      // style: alertStyle,
      // type: AlertType.info,
      title: 'notification'.tr(),
      desc:'title_check_vip'.tr(),
      image: Image.asset("acssets/images/catEmoji/crown.png"),
      buttons: [
        DialogButton(
          gradient:
              LinearGradient(colors: [colorPinkFf758c(), colorPinkFf7eb3()]),
          child: const Text(
            "Ok",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(50.0),
        ),
      ],
    ).show();
  }
}
