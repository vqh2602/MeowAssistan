import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bmi_bloc.dart';
import '../../../bloc/vaccine_bloc.dart';
import '../../../events/bmi_event.dart';
import '../../../events/vaccine_event.dart';


class AlertDialogRefactorVaccine extends StatelessWidget {
  final int index, id;
  const AlertDialogRefactorVaccine({required this.index,required this.id});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete?',
        style: TextStyle(color: Color(0xFF49565e)),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF))),
            child: const Text(
              'YES',
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () {
              BlocProvider.of<VaccineBloc>(context)
                  .add(VaccineDeleteEvent(index: index, id: id));
              Navigator.pop(context);
            }),
        ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF))),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Color(0xFF49565e)),
            ))
      ],

    );
}}
