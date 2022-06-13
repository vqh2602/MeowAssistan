import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../../Color/colors.dart';
import '../../../bloc/bmi_bloc.dart';
import '../../../events/bmi_event.dart';
import '../../../models/hive_Models/bmi.dart';


class EditBMIScreen extends StatefulWidget {
  final bool newNote;
  final BMI? bmi;
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
  final TextEditingController _textcontrolr = TextEditingController();
  final TextEditingController _textcontrolh = TextEditingController();
  DateTime? selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(Platform.localeName);
    if (!widget.newNote) {
      setState(() {
        selectedDate = widget.bmi!.dayAdd;
        _textcontrolr.text = widget.bmi!.ribCage.toString();
        _textcontrolh.text = widget.bmi!.legLength.toString();
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
                              'Ngay thêm',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  color: Colors.white),
                            ),
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
                      const Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'Bán Kính:',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  color: Colors.white),
                            ),
                          ),
                          TextFormField(
                            controller: _textcontrolr,
                            decoration: const InputDecoration(
                                // labelText: 'Cat Name',
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(width: 3, color: colorPinkFf758c()),
                                //   borderRadius: BorderRadius.circular(15),
                                // ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(width: 3, color: colorPinkFf758c()),
                                //   borderRadius: BorderRadius.circular(15),
                                // )
                                ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: colorPinkFf758c(),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'Chiều Dài:',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  color: Colors.white),
                            ),
                          ),
                          TextFormField(
                            controller: _textcontrolh,
                            decoration: const InputDecoration(
                                // labelText: 'Cat Name',
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(width: 3, color: colorPinkFf758c()),
                                //   borderRadius: BorderRadius.circular(15),
                                // ),
                                // focusedBorder: OutlineInputBorder(
                                //   borderSide:
                                //       BorderSide(width: 3, color: colorPinkFf758c()),
                                //   borderRadius: BorderRadius.circular(15),
                                // )
                                ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(10)),

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
                                  ? BlocProvider.of<BMIBloc>(context).add(
                                      BMIAddEvent(
                                          bmi: BMI(
                                              id: widget.id!,
                                              dayAdd: selectedDate!,
                                              ribCage: double.parse(
                                                  _textcontrolr.text),
                                              legLength: double.parse(
                                                  _textcontrolh.text))))
                                  : BlocProvider.of<BMIBloc>(context).add(
                                      BMIEditEvent(
                                          index: widget.index!,
                                          bmi: BMI(
                                              id: widget.bmi!.id,
                                              dayAdd: selectedDate!,
                                              ribCage: double.parse(
                                                  _textcontrolr.text),
                                              legLength: double.parse(
                                                  _textcontrolh.text))));
                              Navigator.pop(context);
                            }
                          },
                          child:
                              widget.newNote ? const Text('Create') : const Text('UpDate'),
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
