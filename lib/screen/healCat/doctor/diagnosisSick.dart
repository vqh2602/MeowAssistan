import 'package:easy_localization/easy_localization.dart';
import 'package:ff_stars/ff_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../../Color/colors.dart';
import '../../../data/dataSick.dart';

class DiagnosisSick extends StatelessWidget{
  bool vip;
  List<int> lstTrieuchung;
  DiagnosisSick({required this.vip,required this.lstTrieuchung});


  @override
  Widget build(BuildContext context) {

    List<PhanTram> lstPT = getBenhTatinTrieuChung(lstTrieuchung);

    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: lstPT.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lstPT[index].name,style: TextStyle(
                              color: colorPinkFf758c(),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('nguy_hiem').tr(),
                              FFStars(
                                normalStar: Image.asset("acssets/images/cats/christmasNormal.png"),
                                selectedStar: Image.asset("acssets/images/cats/christmasSelected.png"),
                                // starsChanged: (realStars, selectedStars) {
                                //   print("real: $selectedStars, final: $realStars");
                                // },
                                // step: 0.01,
                                // followChange: false,
                                defaultStars: getStar(lstPT[index].name)+0.0,
                                starCount: 5,
                                // starHeight: 40,
                                // starWidth: 40,
                                // starMargin: 20,
                                justShow: true,
                                rounded: true,
                                followChange: true,
                              ),
                            ],),
                          SizedBox(height: 5,),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: new LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 100,
                              animation: true,
                              lineHeight: 30.0,
                              animationDuration: 2500,
                              percent: lstPT[index].phantramtrung/ lstTrieuchung.length,
                              center: Text('trung_khop').tr(namedArgs: {'style':'${(lstPT[index].phantramtrung*100 / lstTrieuchung.length).toStringAsFixed(2)}'}),
                              barRadius: const Radius.circular(16),
                              backgroundColor: colorDFDFDF(),
                              progressColor: colorPinkFf758c(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

              }),
        ),
      ),
    );
  }



}