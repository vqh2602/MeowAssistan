import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../Color/colors.dart';

class CalculatorAgeCat extends StatefulWidget {
  const CalculatorAgeCat({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyCalculatorAgeCat();
  }
}

class _MyCalculatorAgeCat extends State<CalculatorAgeCat> {
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            child:  Container(
              padding: EdgeInsets.all(20),
              width: 70.w,
              height: 35.h,
              child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget> [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: InkWell(
                                onTap: () {
                                  alertInfo();
                                },
                                child: Icon(
                                  Icons.info_outline,
                                  color: colorPinkFf758c(),
                                  size: 35,
                                )),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: colorPinkFf758c(),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          'Ngày sinh của mèo',
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
                                  maxTime: DateTime(2050), onChanged: (date) {
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
                                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                                  : 'no value',
                              style: TextStyle(color: colorPinkFf758c()),
                            )),
                      ),
                      IconButton(onPressed: (){
                        alertCatYears(selectedDate!);
                      }, icon: Icon(Icons.calculate_outlined,color: colorPinkFf758c(),), iconSize: 40,)
                    ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getDays (DateTime dateTime, bool cat) {
    final birthday = dateTime;
    final datenow = DateTime.now();
    final difference = datenow
        .difference(birthday)
        .inDays;
    print(difference);

    if (difference < 32) {
      return cat ? '<1 tháng' : '3 ~ 6 tháng';
    } else if (difference > 31 && difference < 63) {
      return cat ? '2 tháng' : '3 tuổi';
    } else if (difference > 62 && difference < 125) {
      return cat ? '4 tháng' : '6 tuổi';
    } else if (difference > 124 && difference < 187) {
      return cat ? '6 tháng' : '14 tuổi';
    } else if (difference > 186 && difference < 373) {
      return cat ? '1 năm' : '18 tuổi';
    } else if (difference > 372 && difference < 745) {
      return cat ? '2 năm' : '22 tuổi';
    } else if (difference > 744 && difference < 1117) {
      return cat ? '3 năm' : '26 tuổi';
    } else if (difference > 1116 && difference < 1489) {
      return cat ? '4 năm' : '30 tuổi';
    } else if (difference >= 1489 && difference <= 1860) {
      return cat ? '5 năm' : '36 tuổi';
    } else if (difference >= 1861 && difference <= 2232) {
      return cat ? '6 năm' : '40 tuổi';
    } else if (difference >= 2233 && difference <= 2604) {
      return cat ? '7 năm' : '44 tuổi';
    } else if (difference >= 2605 && difference <= 2976) {
      return cat ? '8 năm' : '48 tuổi';
    } else if (difference >= 2977 && difference <= 3348) {
      return cat ? '9 năm' : '52 tuổi';
    } else if (difference >= 3349 && difference <= 3720) {
      return cat ? '10 năm' : '56 tuổi';
    } else if (difference >= 3721 && difference <= 4092) {
      return cat ? '11 năm' : '60 tuổi';
    } else if (difference >= 4093 && difference <= 4464) {
      return cat ? '12 năm' : '64 tuổi';
    } else if (difference >= 4465 && difference <= 4836) {
      return cat ? '13 năm' : '68 tuổi';
    } else if (difference >= 4837 && difference <= 5208) {
      return cat ? '14 năm' : '72 tuổi';
    } else if (difference >= 5209 && difference <= 5580) {
      return cat ? '15 năm' : '76 tuổi';
    } else if (difference >= 5581 && difference <= 5952) {
      return cat ? '16 năm' : '80 tuổi';
    } else if (difference >= 5953 && difference <= 6324) {
      return cat ? '17 năm' : '84 tuổi';
    } else if (difference >= 6325 && difference <= 6696) {
      return cat ? '18 năm' : '88 tuổi';
    } else if (difference >= 6697 && difference <= 7068) {
      return cat ? '19 năm' : '92 tuổi';
    } else if (difference >= 7069 && difference <= 7440) {
      return cat ? '20 năm' : '100 tuổi';
    } else if (difference >= 7441 && difference <= 7812) {
      return cat ? '21 năm' : '>100 tuổi';
    } else {
      return cat ? 'erro' : 'erro';
    }
  }

  void alertCatYears(DateTime dateTime){



    Alert(
      context: context,
      title: 'Cat years calculator',
      image: Lottie.asset('acssets/iconAnimation/loaderCat.json'),
      content:Container(
        child:
        RichText(
          text: TextSpan(
            text: 'Cat years: ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: getDays(dateTime, true), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),
              const TextSpan(text: ' <=> Humen years: ', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
              TextSpan(text: getDays(dateTime, false), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),

            ],
          ),
        )
      ),
      buttons: [
        DialogButton(
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }

  void alertInfo() {
    Alert(
      context: context,
      title: 'Thông tin',
      image: Lottie.asset('acssets/iconAnimation/search.json'),
      content: Container(
          child: Column(
            children: [
              Text(
                'Tuổi mèo là gì?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Nếu bạn là một chủ nhân may mắn của một chú mèo, chắc hẳn bạn đang băn khoăn không biết liệu chú mèo của mình có còn đang trong độ tuổi thanh xuân hay có thể đang trải qua giai đoạn khủng hoảng tuổi trung niên. Không cần tìm đâu xa - máy tính tuổi mèo này sẽ cung cấp cho bạn tất cả thông tin bạn cần, chuyển đổi giữa tuổi mèo và tuổi con người.'
                    '\nMột quan niệm sai lầm phổ biến rằng một năm trong cuộc đời của một con mèo tương đương với bảy năm của con người. Trên thực tế, cách tính tuổi mèo phức tạp hơn một chút. Mèo con lớn nhanh khi còn nhỏ, nhưng càng lớn tuổi, quá trình lão hóa càng diễn ra chậm hơn. Có nghĩa là sau một năm, con mèo của bạn già bằng một đứa trẻ bảy tuổi, nhưng đối với những con mèo lớn hơn, mỗi năm chỉ tương đương với bốn tuổi của con người.'
                    '\nĐương nhiên, không phải tất cả các con mèo đều có tuổi giống nhau. Một con mèo sống ngoài trời nhìn chung sẽ có tuổi thọ ngắn hơn một con mèo trong nhà. Ngoài ra, trong khi loài mèo điển hình sống khoảng 10-15 năm, một số giống mèo già đi chậm hơn hoặc nhanh hơn. Tuy nhiên, công cụ tính tuổi mèo này sẽ giúp bạn biết rõ về thâm niên của mèo.'
                    '',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              Text(
                'Làm thế nào để ước tính tuổi của một con mèo?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Làm thế nào để ước tính tuổi của một con mèo?'
                    '\n - Răng của mèo. Nếu bạn phải giải quyết cho chỉ một chỉ số, thì đây là điều nên làm. Mèo con có bộ răng vĩnh viễn đầu tiên khi chúng được khoảng bốn tháng tuổi. Nếu răng của mèo trắng, bạn có thể cho rằng nó khoảng một năm tuổi. Màu vàng hơn gợi ý ở độ tuổi từ một đến hai tuổi, trong khi vôi răng tích tụ hoặc mất răng cho thấy mèo lớn hơn'
                    '\n - Mắt mèo. Mèo con thường có đôi mắt sáng và lấp lánh. Một vài đám mây có thể cho thấy rằng con mèo của bạn đã 10 tuổi trở lên. Ngoài ra, tròng đen của mắt mèo già có vẻ hơi lởm chởm.'
                    '\n - Áo khoác của mèo. Bộ lông của mèo con mềm và mịn, trong khi mèo lớn hơn có xu hướng có bộ lông thô hơn. Nếu bạn tìm thấy một số mảng màu xám hoặc trắng, có thể con mèo đã lớn tuổi.',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              Text(
                'Mèo có thể mang thai ở độ tuổi nào?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Mèo đạt đến độ tuổi thành thục sinh dục khi được bốn tháng tuổi . Điều này có nghĩa là những con mèo còn nhỏ có thể mang thai. Tuy nhiên, việc mang thai sớm chắc chắn không được khuyến khích cho mèo con. Cân nhắc triệt sản cho mèo để tránh mang thai không cần thiết và mèo con đi lạc nhiều hơn.',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
            ],
          )),
      buttons: [
        DialogButton(
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }
}
