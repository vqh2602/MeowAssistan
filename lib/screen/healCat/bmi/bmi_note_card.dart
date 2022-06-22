import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/hive_Models/bmi.dart';

class NoteCard extends StatelessWidget {
  final BMI bmi;
  final int index;

  const NoteCard({required this.bmi, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        color: (index % 2 == 0) ? Colors.red[50] : Colors.blue[50],
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
              Text(
                'ban_kinh',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  wordSpacing: 1.25,
                ),
              ).tr(namedArgs: {'bk':'${bmi.ribCage}'}),
              Text(
                'chieu_dai',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  wordSpacing: 1.25,
                ),
              ).tr(namedArgs: {'cd':'${bmi.legLength}'}),
            ],
          ),
        ),
      ),
    );
  }
}
