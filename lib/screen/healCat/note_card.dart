
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Color/colors.dart';
import '../../models/hive_Models/cats.dart';

class NoteCard extends StatelessWidget {

  final Cat cat;
  final int index;

  const NoteCard({required this.cat,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 20,right: 20),
      child: Card(
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
      Radius.circular(20.0),)),
        color: (index%2==0)? Colors.red[100] : Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left:10,right: 10),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 0,
              ),
             CircleAvatar(
                radius: 40, // Image radius
                backgroundImage:
                AssetImage('acssets/images/cats/${(cat.imageUrl)}'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cat.name}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Sinh nhật: ${ DateFormat('dd/MM/yyyy').format(cat.birt!)}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      wordSpacing: 1.25,),

                  ),
                  Row(
                    children: [
                      const Text('Giới Tính: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            wordSpacing: 1.25,)),
                      (cat.sex!)?const Icon(Icons.male, color: Colors.lightBlueAccent,) : const Icon(Icons.female_rounded, color: Colors.pinkAccent,)
                    ],
                  )
                ],
              ),
              Icon(Icons.chevron_right,color: colorPinkFf758c(),)

            ],
          ),
        ),

      ),);
  }
}