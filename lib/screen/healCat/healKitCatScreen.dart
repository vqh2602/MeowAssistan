
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meowassistan/screen/healCat/bmi/bmiScreen.dart';
import 'package:meowassistan/screen/healCat/vaccine/vaccineScreen.dart';
import 'package:meowassistan/screen/healCat/vermifuge/vermifugeScreen.dart';
import 'package:sizer/sizer.dart';

class HealKitCatScreen extends StatelessWidget{
  int id;
  HealKitCatScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children: <Widget>[
              Align(
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Category',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Colors.black),
                    ),
                    alignment: Alignment.topLeft,
                  )),
                //1
                Row(
                  children: [
                   Expanded(
                     flex: 1,
                     child:  InkWell(
                       onTap: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (BuildContext context) {
                               return BMIScreen(
                                 id: id,
                               );
                             }));

                         // CatDatabase cattt = CatDatabase();
                         // cattt.truyvan(note.id!);
                       },
                       child: Container(
                         margin: EdgeInsets.only(top: 10,bottom: 5,left: 10,right: 5),
                         height: 230,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Colors.deepOrangeAccent.shade100,
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Text('BMI',style: TextStyle(
                                 color: Colors.black,
                                 fontFamily: 'Inter',
                                 fontSize: 15.sp,
                                 fontWeight: FontWeight.bold
                             ),),
                             Text('tính và quản lí BMI'),
                             Align(
                               alignment: Alignment.bottomRight,
                               child: Container(
                                 width: 150,
                                 child: Image.asset('acssets/images/cats/h1.png', fit: BoxFit.fill,),
                               ),
                             )
                           ],
                         ),
                       ),
                     )),
                    Expanded(
                      flex: 1,
                      child:InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return VaccineScreen(
                                  id: id,
                                );
                              }));

                          // CatDatabase cattt = CatDatabase();
                          // cattt.truyvan(note.id!);
                        },
                        child:  Container(
                          height: 230,
                          margin: EdgeInsets.only(top: 10,bottom: 5,left: 5,right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pink.shade100,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10,right: 10),
                              child: Text('Rabies vaccination',style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold
                              ),),),
                              Text('quản lí tiêm phòng'),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 150,
                                    child: Image.asset('acssets/images/cats/h2.png', fit: BoxFit.fill,),
                                  ))
                            ],
                          ),
                        ),
                      ))
                  ],
                ),
              //2
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return VermifugeScreen(
                                id: id,
                              );
                            }));

                        // CatDatabase cattt = CatDatabase();
                        // cattt.truyvan(note.id!);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 5),
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.brown.shade100,
                          ),
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Vermifuge',style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text('quản lí tẩy giun'),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 150,
                                  child: Image.asset('acssets/images/cats/h3.png', fit: BoxFit.fill,),
                                ),
                              )
                            ],
                          )
                      ),
                    ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}