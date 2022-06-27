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

class CatPregnancyCalculator extends StatefulWidget {
  const CatPregnancyCalculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyCatPregnancyCalculator();
  }
}

class _MyCatPregnancyCalculator extends State<CatPregnancyCalculator> {
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage("acssets/images/cats/bgCat4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Card(
              color: Colors.white,
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
                        'day_giao_phoi',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Inter',
                            color: Colors.white),
                      ).tr(),
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

  void alertCatYears(DateTime dateTime){

String ngaygiaophoi = 'day_giao_phoi'.tr(),
    sinhdukien = 'day_sinh_dukien'.tr(),
    sinhsom = 'day_sinh_som'.tr(),
    sinhmuon = 'day_sinh_muon'.tr();

    Alert(
      context: context,
      title: 'Cat Pregnancy Calculator',
      image: Lottie.asset('acssets/iconAnimation/loaderCat.json'),
      content:Container(
          child:
          RichText(
            text: TextSpan(
              text: ngaygiaophoi,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: DateFormat('dd/MM/yyyy').format(dateTime), 
                    style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),
                TextSpan(text: sinhdukien, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                TextSpan(text: DateFormat('dd/MM/yyyy').format(dateTime.add(const Duration(days: 63))), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),
                TextSpan(text: sinhsom, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                TextSpan(text: DateFormat('dd/MM/yyyy').format(dateTime.add(const Duration(days: 58))), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),
                TextSpan(text: sinhmuon, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                TextSpan(text: DateFormat('dd/MM/yyyy').format(dateTime.add(const Duration(days: 71))), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),

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
                'mang_thai',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
              Text(
                'mang_thai_des',
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
