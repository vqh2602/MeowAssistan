import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../Color/colors.dart';
import '../../../bloc/vaccine_bloc.dart';
import '../../../events/vaccine_event.dart';
import '../../../models/hive_Models/vaccine.dart';


class EditBMIScreen extends StatefulWidget {
  final bool newNote;
  final Vaccine? bmi;
  final int? index;
  int? id;
  EditBMIScreen({this.bmi, this.index, required this.newNote, this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyEditCatScreen();
  }
}

class _MyEditCatScreen extends State<EditBMIScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(Platform.localeName);
    if (!widget.newNote) {
      setState(() {
        selectedDate = widget.bmi!.dayAdd;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Padding(padding: EdgeInsets.all(20)),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'ngay_them',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  color: Colors.white),
                            ).tr(namedArgs: {'time':''}),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  //                   <--- left side
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(1980),
                                      maxTime: DateTime(2050),
                                      onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    setState(() {
                                      selectedDate = date;
                                    });
                                    print('confirm $date');
                                  },
                                      currentTime: DateTime.now(),
                                      locale: (Platform.localeName == 'vi_VN')
                                          ? LocaleType.vi
                                          : LocaleType.en);
                                },
                                child: Text(
                                  (selectedDate != null)
                                      ? DateFormat('dd/MM/yyyy')
                                          .format(selectedDate!)
                                      : 'no value',
                                  style: TextStyle(color: colorPinkFf758c()),
                                )),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('Processing Data')),
                              // );
                              widget.newNote
                                  ? BlocProvider.of<VaccineBloc>(context).add(
                                  VaccineAddEvent(
                                          bmi: Vaccine(
                                              id: widget.id!,
                                              dayAdd: selectedDate!,
                                              )))
                                  : BlocProvider.of<VaccineBloc>(context).add(
                                  VaccineEditEvent(
                                          index: widget.index!,
                                          bmi: Vaccine(
                                              id: widget.bmi!.id,
                                              dayAdd: selectedDate!,)));
                              Navigator.pop(context);
                            }
                          },
                          child:
                              widget.newNote ? const Text('create').tr() : const Text('update').tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
