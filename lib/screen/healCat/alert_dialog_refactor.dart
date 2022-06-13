import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cat_bloc.dart';
import '../../events/cat_event.dart';



class AlertDialogRefactor extends StatelessWidget {
  final int index;
  const AlertDialogRefactor({required this.index});
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
              BlocProvider.of<CatBloc>(context)
                  .add(CatDeleteEvent(index: index));
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
