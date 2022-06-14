import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../Color/colors.dart';
import '../../bloc/cat_bloc.dart';
import '../../data/dataCatAvatar.dart';
import '../../events/cat_event.dart';
import '../../models/hive_Models/cats.dart';

class EditCatScreen extends StatefulWidget {
  final bool newNote;
  final Cat? cat;
  final int? index;
  const EditCatScreen({this.cat, this.index, required this.newNote});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyEditCatScreen();
  }
}

class _MyEditCatScreen extends State<EditCatScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textcontrol = TextEditingController();
  String dropdownValue = 'male';
  String dropdownImage = 'avt1.jpg';
  DateTime? selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(Platform.localeName);
    if(!widget.newNote){
      setState(() {
        dropdownValue = widget.cat!.sex!?'male':'female';
        dropdownImage = widget.cat!.imageUrl!;
        selectedDate = widget.cat!.birt!;
        _textcontrol.text = widget.cat!.name!;
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
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'acssets/images/cats/frameCatBg.png',
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    // height: 500,
                    margin: const EdgeInsets.only(
                      top: 150,
                    ),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Text(
                                      'Cat name',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Inter',
                                          color: Colors.white),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _textcontrol,
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Text(
                                      'Ngay Sinh',
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
                                              locale: (Platform.localeName ==
                                                      'vi_VN')
                                                  ? LocaleType.vi
                                                  : LocaleType.en);
                                        },
                                        child: Text(
                                          (selectedDate != null)
                                              ? DateFormat('dd/MM/yyyy')
                                                  .format(selectedDate!)
                                              : 'no value',
                                          style: TextStyle(
                                              color: colorPinkFf758c()),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Text(
                                      'Gioi tinh',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Inter',
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: dropdownValue,
                                      icon: Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: colorPinkFf758c(),
                                      ),
                                      elevation: 2,
                                      style:
                                          TextStyle(color: colorPinkFf758c()),
                                      underline: Container(
                                        height: 2,
                                        color: colorPinkFf758c(),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'male',
                                        'female',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Text(
                                      'Avatar',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Inter',
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: double.infinity,
                                    child: Center(
                                      child: DropdownButton<String>(
                                        // isExpanded: true,
                                        value: dropdownImage,
                                        // icon: Icon(Icons.arrow_drop_down_outlined, color: colorPinkFf758c(),),
                                        style:
                                        TextStyle(color: colorPinkFf758c()),
                                        underline: Container(
                                          height: 0,
                                          color: colorPinkFf758c(),
                                        ),
                                        onChanged: (newValue) {
                                          setState(() {
                                            dropdownImage = newValue.toString();
                                          });
                                        },
                                        items: listCatAvatar.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'acssets/images/cats/$value',
                                                  width: 100,
                                                  height: 100,
                                                ),
                                                Text(value)
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
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
                                          ? BlocProvider.of<CatBloc>(context)
                                              .add(CatAddEvent(
                                                  cat: Cat(
                                                      id: Random().nextInt(
                                                              999999999) +
                                                          100000000,
                                                      name: _textcontrol.text,
                                                      birt: selectedDate,
                                                      sex: (dropdownValue == 'male')
                                                          ? true
                                                          : false,
                                                      imageUrl: dropdownImage)))
                                          : BlocProvider.of<CatBloc>(context)
                                              .add(CatEditEvent(
                                                  index: widget.index!,
                                                  cat: Cat(
                                                      id: widget.cat!.id,
                                                      name: _textcontrol.text,
                                                      birt: selectedDate,
                                                      sex: (dropdownValue ==
                                                              'male')
                                                          ? true
                                                          : false,
                                                      imageUrl:
                                                          dropdownImage)));
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: widget.newNote?const Text('Tạo'):const Text('Cập nhật'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
