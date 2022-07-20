import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/screen/healCat/vermifuge/vermifuge_alert_dialog_refactor.dart';
import 'package:meowassistan/screen/healCat/vermifuge/vermifuge_edit_note.dart';
import 'package:meowassistan/screen/healCat/vermifuge/vermifuge_edit_note.dart';
import 'package:sizer/sizer.dart';



import '../../../Color/colors.dart';
import '../../../bloc/worm_bloc.dart';
import '../../../events/worm_event.dart';
import '../../../states/worm_state.dart';
import 'vermifuge_note_card.dart';

class VermifugeScreen extends StatelessWidget {
  int id;
  VermifugeScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WormBloc>(context).add(WormInitialEvent(id: id));

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return EditWormScreen(
                newNote: true,
                id: id,
              );
            }));
            //  BlocProvider.of<CatBloc>(context).add(CatAddEvent(cat: Cat(id: 001,name: 'aaa',birt: DateTime.now(),sex: true),));
            print('add');
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("acssets/images/cats/h3bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<WormBloc, WormState>(
              builder: (context, state) {
                print('cat->bmiscreen: $id');
                if (state is YourWormState) {
                  return NoteGrid(state: state);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }
}

class NoteGrid extends StatelessWidget {
  final YourWormState state;
  const NoteGrid({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Center(
                    //   child: Text(
                    //     'Rabies vaccination',
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.white,
                    //       fontFamily: 'Inter',
                    //       fontWeight: FontWeight.bold,
                    //       decoration: TextDecoration.underline,
                    //       decorationStyle: TextDecorationStyle.dashed,
                    //     ),
                    //   ),
                    // ),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: BlurryContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Repeat day:', style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Center(
                                    child: Text(state.bmi.length==0? 'no value': '${DateFormat('dd-MM-yyyy').format(state.bmi[0].dayAdd.add(Duration(hours: 4383)))}' ,style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                  Text('so late:  ${state.bmi.length==0? 'no value': '${DateTime.now().difference(state.bmi[0].dayAdd).inDays > 0 ?DateTime.now().difference(state.bmi[0].dayAdd.add(Duration(hours: 4383))).inDays: 0}'} days',style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal
                                  ),)
                                ],
                              ),
                              blur: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.23,
                              elevation: 0,
                              color: Colors.black12,
                              padding: const EdgeInsets.all(8),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            )))
                  ],
                )
              ],
            )),
        Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.bmi.length,
                  // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 1,
                  //   // childAspectRatio: 0.72,
                  //   // mainAxisSpacing: 10,
                  //   // crossAxisSpacing: 10,
                  // ),

                  itemBuilder: (context, index) {
                    final note = state.bmi[index];
                    return SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (BuildContext context) {
                          //       return CalculateBmiScreen(
                          //         ribCage: note.ribCage,
                          //         legLength: note.legLength,
                          //       );
                          //     }));

                          // CatDatabase cattt = CatDatabase();
                          // cattt.truyvan(note.id!);
                        },
                        onDoubleTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return EditWormScreen(
                              bmi: note,
                              index: index,
                              newNote: false,
                            );
                          }));
                        },
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  AlertDialogRefactorWorm(
                                    index: index,
                                    id: note.id,
                                  ));
                        },
                        child: NoteCard(
                          bmi: note,
                          index: index,
                        ),
                      ),
                    );
                  }),
            ))
      ],
    );
  }
}
