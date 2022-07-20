import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../bloc/worm_bloc.dart';

import '../../../events/worm_event.dart';


class AlertDialogRefactorWorm extends StatelessWidget {
  final int index, id;
  const AlertDialogRefactorWorm({required this.index,required this.id});
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
              BlocProvider.of<WormBloc>(context)
                  .add(WormDeleteEvent(index: index, id: id));
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
