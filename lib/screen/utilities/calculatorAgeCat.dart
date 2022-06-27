import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../Color/colors.dart';
import '../../admod/admod.dart';

class CalculatorAgeCat extends StatefulWidget {
  const CalculatorAgeCat({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyCalculatorAgeCat();
  }
}

class _MyCalculatorAgeCat extends State<CalculatorAgeCat> {
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage("acssets/images/cats/bgCat1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Card(
              child:  Container(
                padding: EdgeInsets.all(20),
                width: 70.w,
                height: 35.h,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:<Widget> [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: InkWell(
                              onTap: () {
                                alertInfo();
                              },
                              child: Icon(
                                Icons.info_outline,
                                color: colorPinkFf758c(),
                                size: 35,
                              )),
                        )),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: colorPinkFf758c(),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        'Ngày sinh của mèo',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Inter',
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            //                   <--- left side
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1980),
                                maxTime: DateTime(2050), onChanged: (date) {
                                  print('change $date');
                                }, onConfirm: (date) {
                                  setState(() {
                                    selectedDate = date;
                                  });
                                  print('confirm $date');
                                },
                                currentTime: DateTime.now(),
                                locale: (Platform.localeName == 'vi_VN')
                                    ? LocaleType.vi
                                    : LocaleType.en);
                          },
                          child: Text(
                            (selectedDate != null)
                                ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                                : 'no value',
                            style: TextStyle(color: colorPinkFf758c()),
                          )),
                    ),
                    IconButton(onPressed: (){
                      showInterstitialAd();
                      alertCatYears(selectedDate!);
                    }, icon: Icon(Icons.calculate_outlined,color: colorPinkFf758c(),), iconSize: 40,)
                  ],
                ),
              ),
            ),
          ),
        )

      ),
    );
  }

  String getDays (DateTime dateTime, bool cat) {
    final birthday = dateTime;
    final datenow = DateTime.now();
    final difference = datenow
        .difference(birthday)
        .inDays;
    print(difference);
    String month = 'thang'.tr();
    String year = 'nam'.tr();
    String age = 'age'.tr();
    if (difference < 32) {
      return cat ? '<1 $month' : '3 ~ 6 $month';
    } else if (difference > 31 && difference < 63) {
      return cat ? '2 $month' : '3 $age';
    } else if (difference > 62 && difference < 125) {
      return cat ? '4 $month' : '6 $age';
    } else if (difference > 124 && difference < 187) {
      return cat ? '6 $month' : '14 $age';
    } else if (difference > 186 && difference < 373) {
      return cat ? '1 $year' : '18 $age';
    } else if (difference > 372 && difference < 745) {
      return cat ? '2 $year' : '22 $age';
    } else if (difference > 744 && difference < 1117) {
      return cat ? '3 $year' : '26 $age';
    } else if (difference > 1116 && difference < 1489) {
      return cat ? '4 $year' : '30 $age';
    } else if (difference >= 1489 && difference <= 1860) {
      return cat ? '5 $year' : '36 $age';
    } else if (difference >= 1861 && difference <= 2232) {
      return cat ? '6 $year' : '40 $age';
    } else if (difference >= 2233 && difference <= 2604) {
      return cat ? '7 $year' : '44 $age';
    } else if (difference >= 2605 && difference <= 2976) {
      return cat ? '8 $year' : '48 $age';
    } else if (difference >= 2977 && difference <= 3348) {
      return cat ? '9 $year' : '52 $age';
    } else if (difference >= 3349 && difference <= 3720) {
      return cat ? '10 $year' : '56 $age';
    } else if (difference >= 3721 && difference <= 4092) {
      return cat ? '11 $year' : '60 $age';
    } else if (difference >= 4093 && difference <= 4464) {
      return cat ? '12 $year' : '64 $age';
    } else if (difference >= 4465 && difference <= 4836) {
      return cat ? '13 $year' : '68 $age';
    } else if (difference >= 4837 && difference <= 5208) {
      return cat ? '14 $year' : '72 $age';
    } else if (difference >= 5209 && difference <= 5580) {
      return cat ? '15 $year' : '76 $age';
    } else if (difference >= 5581 && difference <= 5952) {
      return cat ? '16 $year' : '80 $age';
    } else if (difference >= 5953 && difference <= 6324) {
      return cat ? '17 $year' : '84 $age';
    } else if (difference >= 6325 && difference <= 6696) {
      return cat ? '18 $year' : '88 $age';
    } else if (difference >= 6697 && difference <= 7068) {
      return cat ? '19 $year' : '92 $age';
    } else if (difference >= 7069 && difference <= 7440) {
      return cat ? '20 $year' : '100 $age';
    } else if (difference >= 7441 && difference <= 7812) {
      return cat ? '21 $year' : '>100 $age';
    } else {
      return cat ? 'erro' : 'erro';
    }
  }

  void alertCatYears(DateTime dateTime){



    Alert(
      context: context,
      title: 'Cat years calculator',
      image: Lottie.asset('acssets/iconAnimation/loaderCat.json'),
      content:Container(
        child:
        RichText(
          text: TextSpan(
            text: 'Cat years: ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: getDays(dateTime, true), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),
              const TextSpan(text: ' <=> Human years: ', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
              TextSpan(text: getDays(dateTime, false), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),

            ],
          ),
        )
      ),
      buttons: [
        DialogButton(
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }

  void alertInfo() {
    Alert(
      context: context,
      title: 'info'.tr(),
      image: Lottie.asset('acssets/iconAnimation/search.json'),
      content: Container(
          child: Column(
            children: [
              Text(
                'cat_year',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
              Text(
                'cat_year_des',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ).tr(),
              Text(
                'cal_cat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
              Text(
                'cal_cat_des',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ).tr(),
              Text(
                'cat_mangthai',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
              Text(
                'cat_mangthai_des',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ).tr(),
            ],
          )),
      buttons: [
        DialogButton(
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }
}
