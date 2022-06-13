
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/hive_Models/bmi.dart';

class NoteCard extends StatelessWidget {

  final BMI bmi;
  final int index;

   const NoteCard({required this.bmi,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 20,right: 20),
      child: Card(
        color: (index%2==0)? Colors.red[50] : Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left:10,right: 10),
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ngày thêm: ${ DateFormat('dd/MM/yyyy')
                        .format(bmi.dayAdd)}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Bán Kính: ${bmi.ribCage} cm',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      wordSpacing: 1.25,),

                  ),
                  Text(
                    'Chiều dài: ${bmi.legLength} cm',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      wordSpacing: 1.25,),

                  ),

                ],
          ),
        ),

      ),);
  }
}