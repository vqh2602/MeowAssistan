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

class CatBenadrylCalculator extends StatefulWidget {
  const CatBenadrylCalculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyCatBenadrylCalculator();
  }
}

class _MyCatBenadrylCalculator extends State<CatBenadrylCalculator> {
  DateTime? selectedDate = DateTime.now();
  TextEditingController textEditingControlleNumber = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingControlleNumber.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage("acssets/images/cats/bgCat2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Card(
              child: Container(
                padding: EdgeInsets.all(20),
                width: 50.w,
                height: 35.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
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
                        'can_nang',
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
                      child: TextField(
                        controller: textEditingControlleNumber,
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'nhap_can_nang'.tr(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showInterstitialAd();
                        alertCatYears(
                            double.parse(textEditingControlleNumber.text));
                      },
                      icon: Icon(
                        Icons.calculate_outlined,
                        color: colorPinkFf758c(),
                      ),
                      iconSize: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        )

      ),
    );
  }

  void alertCatYears(double cannang) {
    double ketQuaml = (cannang * 2.20462) / 2.5;
    double ketQuamg = (cannang * 2.20462);
    Alert(
      context: context,
      title: 'Cat Benadryl Dosage Calculator',
      image: Lottie.asset('acssets/iconAnimation/loaderCat.json'),
      content: Container(
          child: RichText(
        text: TextSpan(
          text: 'nong_do'.tr(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: '${ketQuamg.toStringAsFixed(2)} mg',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorPinkFf758c())),
            TextSpan(
                text: 'hoac'.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            TextSpan(
                text: '${ketQuaml.toStringAsFixed(2)} ml',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorPinkFf758c())),
            TextSpan(
                text: 'an_toan'.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            // TextSpan(text: getDays(dateTime, false), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),
          ],
        ),
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

  void alertInfo() {
    Alert(
      context: context,
      title: 'info'.tr(),
      image: Lottie.asset('acssets/iconAnimation/search.json'),
      content: Container(
          child: Column(
        children: [
          Text(
            'ben_cat',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).tr(),
          Text(
            'ben_cat_des',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ).tr(),
          Text(
            'ben_cat_antoan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).tr(),
          Text(
            'ben_cat_antoan_des',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ).tr()
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
