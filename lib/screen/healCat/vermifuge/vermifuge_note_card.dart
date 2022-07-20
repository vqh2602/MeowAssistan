import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



import '../../../models/hive_Models/worm.dart';

class NoteCard extends StatelessWidget {
  final Worm bmi;
  final int index;

  const NoteCard({required this.bmi, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        color: (index % 2 == 0) ? Colors.green[50] : Colors.teal[50],
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ngay_them',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ).tr(namedArgs: {
                'time': '${DateFormat('dd/MM/yyyy').format(bmi.dayAdd)}'
              }),

            ],
          ),
        ),
      ),
    );
  }
}
