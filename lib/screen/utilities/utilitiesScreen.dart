import 'package:flutter/material.dart';
import 'package:meowassistan/screen/utilities/calculatorAgeCat.dart';
import 'package:meowassistan/screen/utilities/catBenadrylCalculator.dart';
import 'package:sizer/sizer.dart';

import '../../Color/colors.dart';

class UtilitiesScreen extends StatelessWidget {
  List<String> lstUtilities = [
    'Tính tuổi mèo',
    'Tính liều Benadryl',
    'Tính calo mèo',
    'Tính thời gian\nmang thai'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: colorPinkFf758c(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                 Align(
                   child:  Container(
                     padding: EdgeInsets.all(20),
                     child: Text('Tiện ích',
                       style: TextStyle(
                           fontSize: 20.sp,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Inter',
                           color: Colors.white
                       ),),
                 alignment: Alignment.topLeft,))
                  ],
                )),
            Expanded(
              flex: 9,
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

  void pushPage(int index, BuildContext context){
switch(index){
  case 0:
  Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
        return CalculatorAgeCat();
      }));
    break;
  case 1:
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return CatBenadrylCalculator();
        }));
    break;
  case 2: break;
  case 3: break;
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
                    child: Text('$title',style: TextStyle(
                      fontSize: 11.5.sp,
                      color: colorPinkFf758c(),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold
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
                    child: Text('$title',style: TextStyle(
                      fontSize: 11.5.sp,
                      color: colorPinkFf758c(),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold
                    ),),
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
}
