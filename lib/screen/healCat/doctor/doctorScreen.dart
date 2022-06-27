import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meowassistan/data/dataSick.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../../Color/colors.dart';
import '../../../admod/admod.dart';
import '../../../data/dataCatDoctor.dart';
import 'diagnosisSick.dart';

class DoctorScreen extends StatefulWidget {
  bool vip;
  DoctorScreen({required this.vip});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyDoctorScreen();
  }
}

class _MyDoctorScreen extends State<DoctorScreen> {
  List<int> _selecteCategorys = [];
  bool checkValue1 = false,checkValue2 = false,checkValue3 = false,checkValue4 = false,checkValue5 = false,checkValue6 = false;


  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(category_id);
        print(category_id);
        print(_selecteCategorys);
      });
    } else {
      setState(() {
        _selecteCategorys.remove(category_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle(){
      return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        fontFamily: 'Inter'
      );
    }

    // Widget lstTrieuChungTitle(String title, int group){
    //   return
    // }

    return new Scaffold(
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showInterstitialAd();
          if(widget.vip){
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: DiagnosisSick(
                      vip:widget.vip,
                      lstTrieuchung: _selecteCategorys,
                    )));
          }else{
            showAlertVip(context);
          }
        },
    icon: Icon(Icons.start,color: Colors.white,),
    label: Text("Start",style: TextStyle(color: Colors.white),),),
      body: SafeArea(
          child:SingleChildScrollView(
            child:  Column(
              children: [
                Center(
                  child: Text(
                    'cac_trieu_chung',
                    style: TextStyle(
                      fontSize: 25,
                      color: colorPinkFf758c(),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ).tr(),
                ),
                Align(
                  child: InkWell(
                    onTap: () {
                      alertInfo();
                    },
                    child: Icon( Icons.info_outline,
                      color: colorPinkFf758c(),
                      size: 35,),
                  ),
                  alignment: Alignment.centerRight,
                ),
                
    // chieu chung khac
                SizedBox(
  child: Column(
    children: [
      Container(
        color: colorPinkFf758c(),
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
            decoration: BoxDecoration(
                color: colorPinkFf758c(),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text('tt_khac',style: textStyle(),).tr(),
          ),
          InkWell(
            onTap: (){
              setState(() {
                checkValue1 = !checkValue1;
              });
            },
            child: !checkValue1?Icon(Icons.keyboard_double_arrow_down, color: Colors.white,size: 30.sp,)
                :Icon(Icons.keyboard_double_arrow_up, color: Colors.white,size: 30.sp,),
          )
        ],),
      ),
      checkValue1
          ? SizedBox(
        height: 50.h,
        width: 70.w,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: getListTrieuChung(1).length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                value: _selecteCategorys.contains(
                    getListTrieuChung(1)[index].Id),
                onChanged: (bool? selected) {
                  _onCategorySelected(selected!,
                      getListTrieuChung(1)[index].Id);
                },
                title: Text(getListTrieuChung(1)[index].name),
              );
            }),
      )
          : SizedBox(),
    ],
  ),
),

    // chieu chung ngoai da
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        color: colorPinkFf758c(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text('tt_ngoai_da',style: textStyle(),).tr(),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                checkValue2 = !checkValue2;
                              });
                            },
                            child: !checkValue2?Icon(Icons.keyboard_double_arrow_down, color: Colors.white,size: 30.sp,)
                                :Icon(Icons.keyboard_double_arrow_up, color: colorPinkFf758c(),size: 30.sp,),
                          )
                        ],),
                      ),
                      checkValue2
                          ? SizedBox(
                        height: 50.h,
                        width: 70.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: getListTrieuChung(2).length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: _selecteCategorys.contains(
                                    getListTrieuChung(2)[index].Id),
                                onChanged: (bool? selected) {
                                  _onCategorySelected(selected!,
                                      getListTrieuChung(2)[index].Id);
                                },
                                title: Text(getListTrieuChung(2)[index].name),
                              );
                            }),
                      )
                          : SizedBox(),
                    ],
                  ),
                ),


                // ho hap
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        color: colorPinkFf758c(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text('tt_ho_hap',style: textStyle(),).tr(),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                checkValue3 = !checkValue3;
                              });
                            },
                            child: !checkValue3?Icon(Icons.keyboard_double_arrow_down, color: Colors.white,size: 30.sp,)
                                :Icon(Icons.keyboard_double_arrow_up, color: Colors.white,size: 30.sp,),
                          )
                        ],),
                      ),
                      checkValue3
                          ? SizedBox(
                        height: 50.h,
                        width: 70.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: getListTrieuChung(3).length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: _selecteCategorys.contains(
                                    getListTrieuChung(3)[index].Id),
                                onChanged: (bool? selected) {
                                  _onCategorySelected(selected!,
                                      getListTrieuChung(3)[index].Id);
                                },
                                title: Text(getListTrieuChung(3)[index].name),
                              );
                            }),
                      )
                          : SizedBox(),
                    ],
                  ),
                ),

      // bai tiet + tieu hoa
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        color: colorPinkFf758c(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text('tt_baitiet',style: textStyle(),).tr(),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                checkValue4 = !checkValue4;
                              });
                            },
                            child: !checkValue4?Icon(Icons.keyboard_double_arrow_down, color: Colors.white,size: 30.sp,)
                                :Icon(Icons.keyboard_double_arrow_up, color: Colors.white,size: 30.sp,),
                          )
                        ],),
                      ),
                      checkValue4
                          ? SizedBox(
                        height: 50.h,
                        width: 70.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: getListTrieuChung(4).length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: _selecteCategorys.contains(
                                    getListTrieuChung(4)[index].Id),
                                onChanged: (bool? selected) {
                                  _onCategorySelected(selected!,
                                      getListTrieuChung(4)[index].Id);
                                },
                                title: Text(getListTrieuChung(4)[index].name),
                              );
                            }),
                      )
                          : SizedBox(),
                    ],
                  ),
                ),

// he than kinh
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        color: colorPinkFf758c(),
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text('tt_thankinh',style: textStyle(),).tr(),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                checkValue5 = !checkValue5;
                              });
                            },
                            child: !checkValue5?Icon(Icons.keyboard_double_arrow_down, color: Colors.white,size: 30.sp,)
                                :Icon(Icons.keyboard_double_arrow_up, color: Colors.white,size: 30.sp,),
                          )
                        ],),
                      ),
                      checkValue5
                          ? SizedBox(
                        height: 50.h,
                        width: 70.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: getListTrieuChung(5).length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: _selecteCategorys.contains(
                                    getListTrieuChung(5)[index].Id),
                                onChanged: (bool? selected) {
                                  _onCategorySelected(selected!,
                                      getListTrieuChung(5)[index].Id);
                                },
                                title: Text(getListTrieuChung(5)[index].name),
                              );
                            }),
                      )
                          : SizedBox(),
                    ],
                  ),
                ),

// vận động
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        color: colorPinkFf758c(),
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text('tt_vandong',style: textStyle(),).tr(),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                checkValue6 = !checkValue6;
                              });
                            },
                            child: !checkValue6?Icon(Icons.keyboard_double_arrow_down, color: Colors.white,size: 30.sp,)
                                :Icon(Icons.keyboard_double_arrow_up, color: Colors.white,size: 30.sp,),
                          )
                        ],),
                      ),
                      checkValue6
                          ? SizedBox(
                        height: 50.h,
                        width: 70.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: getListTrieuChung(6).length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: _selecteCategorys.contains(
                                    getListTrieuChung(6)[index].Id),
                                onChanged: (bool? selected) {
                                  _onCategorySelected(selected!,
                                      getListTrieuChung(6)[index].Id);
                                },
                                title: Text(getListTrieuChung(6)[index].name),
                              );
                            }),
                      )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
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
                'Làm sao để sử dụng?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Bước1 : click vào mũi tên sau nhóm triệu chứng'
                    '\nBước2 : tích chọn các triệu chứng'
                    '\nBước 3: Click vào nút start'
                    '=> Đợi thành quả thôi',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              Text(
                'Cach hoạt động như thế nào?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Cơ sở dữ liệu hiện tại 61'
                    '\n => hiện tại chưa có một ứng dụng nào có thể thay thế bác sĩ thú y '
                    'Ứng dụng chỉ để tham khảo, nếu có triệu trứng hãy đưa mèo của bạn đến '
                    'cơ sở thú y gần nhất!',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
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

  void showAlertVip(BuildContext context){


    Alert(
      context: context,
      // style: alertStyle,
      // type: AlertType.info,
      title: 'notification'.tr(),
      desc: 'title_check_vip'.tr(),
      image: Image.asset("acssets/images/catEmoji/crown.png"),
      buttons: [
        DialogButton(
          gradient: LinearGradient(colors: [
            colorPinkFf758c(),
            colorPinkFf7eb3()
          ]),
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20,),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(50.0),
        ),
      ],
    ).show();
  }

}
