import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../Color/colors.dart';

class CalculateBmiScreen extends StatelessWidget{

  CalculateBmiScreen({Key? key ,required this.ribCage,required this.legLength}) : super(key: key);
  double ribCage,legLength;

  @override
  Widget build(BuildContext context) {
    double value = (((ribCage/0.7062) - legLength )/0.9156) - legLength;
    print(value);
    Color _colors (double num){
      if(num <15.1){
        return Colors.red;
      }else if( num >15 && num < 30){
        return Colors.green;
      }else if( num > 29.9  && num <42.1){
        return Colors.yellow;
      }else if( num > 42 && num < 60.1){
        return Colors.orange;
      }return Colors.red;
    }
    String _textbmi (double num){
      if(num <15.1){
        return 'thieu_can'.tr();
      }else if( num >15 && num < 30){
        return 'binh_thuong'.tr();
      }else if( num > 29.9  && num <42.1){
        return 'thua_can'.tr();
      }else if( num > 42 && num < 60.1){
        return 'beo_phi_eq'.tr();
      }return 'cuc_mo'.tr();
    }

    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child:Center(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child:  InkWell(
                            onTap: () {
                              Alert(
                                  context: context,
                                  title: 'giam_can_title'.tr(),
                                  desc: 'giam_can_des'.tr(),
                                  content: Column(
                                    children: [
                                      Text('cach_do_chi_so_des').tr(),
                                      Image.asset('acssets/images/cats/catBmi.webp')

                                    ],
                                  )

                              ).show();
                            },
                            child: Icon(Icons.info_outline,color: colorPinkFf758c(),size: 35,)),
                      )),
                  Text('Cat BMI: ${_textbmi(value)}'),
                  Text('${value.toStringAsFixed(2)}', style: TextStyle(color: colorPinkFf758c(), fontSize: 30, fontFamily: 'Inter',fontWeight: FontWeight.bold),),
                  SfLinearGauge(
                    minorTicksPerInterval: 1,
                    useRangeColorForAxis: true,
                    animateAxis: true,
                    axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
                    markerPointers: [
                      LinearShapePointer(value: value, height: 25, width: 25, color: _colors(value))
                    ],
                    ranges: const <LinearGaugeRange>[
                      LinearGaugeRange(
                          startValue: 0,
                          endValue: 15,
                          position: LinearElementPosition.outside,
                          color: Colors.red),
                      LinearGaugeRange(
                          startValue: 15.1,
                          endValue: 29.9,
                          position: LinearElementPosition.outside,
                          color: Colors.green),
                      LinearGaugeRange(
                          startValue: 30,
                          endValue: 42,
                          position: LinearElementPosition.outside,
                          color: Colors.yellow),
                      LinearGaugeRange(
                          startValue: 42.1,
                          endValue: 60,
                          position: LinearElementPosition.outside,
                          color: Colors.orange),
                      LinearGaugeRange(
                          startValue: 60.1,
                          endValue: 100,
                          position: LinearElementPosition.outside,
                          color: Colors.red),
                    ],
                  )
                ],
              ),
            )
        )
      ),
    );
  }


}