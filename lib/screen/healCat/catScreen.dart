import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/states/cat_state.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Color/colors.dart';
import '../../bloc/cat_bloc.dart';
import 'alert_dialog_refactor.dart';
import 'bmi/bmiScreen.dart';
import 'edit_note.dart';
import 'note_card.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPinkFf758c(),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const EditCatScreen(newNote: true);
          }));
          //  BlocProvider.of<CatBloc>(context).add(CatAddEvent(cat: Cat(id: 001,name: 'aaa',birt: DateTime.now(),sex: true),));
          print('add');
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if(state is CatLoading){
              return Center(child:  CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorPinkFf758c(),)),
              );
            }
            if (state is YourCatState) {
              return NoteGrid(state: state);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class NoteGrid extends StatelessWidget {
  final YourCatState state;
  const NoteGrid({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'list_cat',
                    style: TextStyle(
                      fontSize: 25,
                      color: colorPinkFf758c(),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ).tr(),
                ),
               Align(
                 alignment: Alignment.centerRight,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 20,right: 20),
                   child:  InkWell(
                       onTap: () {
                         Alert(context: context, title: 'huong_dan'.tr(), desc:'huong_dan_des'.tr()).show();
                       },
                       child: Icon(Icons.info_outline,color: colorPinkFf758c(),size: 35,)),
                 ))
              ],
            )),
        Expanded(
            flex: 7,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: state.cat.length,
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 1,
                //   // childAspectRatio: 0.72,
                //   // mainAxisSpacing: 10,
                //   // crossAxisSpacing: 10,
                // ),

                itemBuilder: (context, index) {
                  final note = state.cat[index];
                  return SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return BMIScreen(
                                id: note.id!,
                              );
                            }));

                        // CatDatabase cattt = CatDatabase();
                        // cattt.truyvan(note.id!);
                      },
                      onDoubleTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return EditCatScreen(
                            cat: note,
                            index: index,
                            newNote: false,
                          );
                        }));
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialogRefactor(index: index));
                      },
                      child: NoteCard(
                        cat: note,
                        index: index
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
