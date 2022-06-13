import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../Color/colors.dart';
import '../../../bloc/bmi_bloc.dart';
import '../../../events/bmi_event.dart';
import '../../../states/bmi_state.dart';
import 'bmi_edit_note.dart';
import 'bmi_alert_dialog_refactor.dart';

import 'bmi_note_card.dart';
import 'calculateBmiScreen.dart';

class BMIScreen extends StatelessWidget {
    int id;
   BMIScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<BMIBloc>(context).add(
        BMIInitialEvent(id: id));
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPinkFf758c(),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return EditBMIScreen(newNote: true, id: id,);
          }));
          //  BlocProvider.of<CatBloc>(context).add(CatAddEvent(cat: Cat(id: 001,name: 'aaa',birt: DateTime.now(),sex: true),));
          print('add');
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<BMIBloc, BMIState>(

          builder: (context, state) {
            print('cat->bmiscreen: $id');
            if (state is YourBMIState) {
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
  final YourBMIState state;
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
                    'Lịch Sử BMI',
                    style: TextStyle(
                      fontSize: 25,
                      color: colorPinkFf758c(),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ),
               Align(
                 alignment: Alignment.centerRight,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 20,right: 20),
                   child:  InkWell(
                       onTap: () {
                         Alert(
                             context: context,
                             title: "Hướng dẫn",
                             desc: "1, Ấn 1 lần để chuyển sang công cụ chi tiết"
                             "\n2, Ấn đúp vào để chỉnh sửa thông tin"
                             "\n3, Ấn giữ để xoá 1 chiếc mèo"
                             "\n* Lưu ý: dữ liệu được lưu cục bộ, sẽ mất nếu bạn xoá dữ liệu ứng dụng"
                                 "\n----------------"
                                 "\n----------------",
                           content: Column(
                             children: [
                               Text('Cách đo chỉ số: \n'
                                   '1,Hãy chắc chắn rằng con mèo của bạn đang đứng với đầu của nó ở vị trí thẳng đứng.'
                                   '\n2,Đo lồng xương sườn của mèo. Lý tưởng nhất, bạn muốn làm điều này ở cấp độ xương sườn thứ 9, nằm ở chân trước của mèo.'
                                   '\n3,Đo chiều dài chân sau của mèo từ đầu gối đến mắt cá chân.'
                                   '\n4,Nhap dữ liệu'),
                               Image.asset('acssets/images/cats/catBmi.webp')

                             ],
                           )

                         ).show();
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return CalculateBmiScreen(
                                ribCage: note.ribCage,
                                legLength: note.legLength,
                              );
                            }));

                        // CatDatabase cattt = CatDatabase();
                        // cattt.truyvan(note.id!);
                      },
                      onDoubleTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return EditBMIScreen(
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
                                AlertDialogRefactorBMI(index: index,id: note.id,));
                      },
                      child: NoteCard(
                       bmi: note,
                        index: index,
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
