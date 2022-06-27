
import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../Color/colors.dart';
import '../../admod/admod.dart';

class CatCalorieCalculator extends StatefulWidget {
  const CatCalorieCalculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyCatCalorieCalculator();
  }
}

class _MyCatCalorieCalculator extends State<CatCalorieCalculator> {

  TextEditingController textEditingControlleNumber = TextEditingController();
  String dropdownImage = 'calo1'.tr();
  List<String> lstCatInfo = [
'calo1',
    'calo2',
    'calo3',
    'calo4',
    'calo5',
    'calo6'
  ];

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
              image: AssetImage("acssets/images/cats/bgCat3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child:  Center(
            child: Card(
              child: Container(
                padding: EdgeInsets.all(20),
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
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Center(
                        child: DropdownButton<String>(
                          // isExpanded: true,
                          value: dropdownImage,
                          // icon: Icon(Icons.arrow_drop_down_outlined, color: colorPinkFf758c(),),
                          style:
                          TextStyle(color: colorPinkFf758c()),
                          underline: Container(
                            height: 0,
                            color: colorPinkFf758c(),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownImage = newValue.toString();
                            });
                          },
                          items: lstCatInfo.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Row(
                                children: [
                                  Text(value)
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showInterstitialAd();
                        alertCatYears(
                            double.parse(textEditingControlleNumber.text), dropdownImage);
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

  double getCons(int index){
    switch(index){
      case 1: return 1.6;break;
      case 2:  return 1.8; break;
      case 3: return 1; break;
      case 4: return 1.7; break;
      case 5: return 3; break;
      case 6: return 2; break;
      default: return 0;
    }
  }

  void alertCatYears(double cannang, String cat) {
    print(getCons(int.tryParse(cat[0])!));
    double caloMin = pow(cannang, 0.75)*70;
    double caloDay = (pow(cannang, 0.75)*70)*getCons(int.tryParse(cat[0])!);

    Alert(
      context: context,
      title: 'Cat Calorie Calculator',
      image: Lottie.asset('acssets/iconAnimation/loaderCat.json'),
      content: Container(
          child: RichText(
            text: TextSpan(
              text: 'calo_min'.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: '${caloMin.toStringAsFixed(2)} cal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: colorPinkFf758c())),
                TextSpan(
                    text: 'calo_day'.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: '${caloDay.toStringAsFixed(2)} cal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: colorPinkFf758c())),
                TextSpan(
                    text: 'calo_cat_eq'.tr(namedArgs: {'cat':cat}),
                    style: const TextStyle(
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
            children:[
              Text(
                'calo_cat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
              Text(
                'calo_cat_des',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ).tr(),
              Text(
                'beo_phi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).tr(),
              Text(
                'beo_phi_des',
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
