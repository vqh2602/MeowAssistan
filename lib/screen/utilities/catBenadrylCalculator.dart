import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../Color/colors.dart';

class CatBenadrylCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyCatBenadrylCalculator();
  }
}

class _MyCatBenadrylCalculator extends State<CatBenadrylCalculator> {
  DateTime? selectedDate = DateTime.now();
  TextEditingController textEditingControlleNumber = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingControlleNumber.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(20),
              width: 50.w,
              height: 35.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
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
                      'Cân nặng',
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
                    child: TextField(
                      controller: textEditingControlleNumber,
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Nhập cân nặng',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      alertCatYears(
                          double.parse(textEditingControlleNumber.text));
                    },
                    icon: Icon(
                      Icons.calculate_outlined,
                      color: colorPinkFf758c(),
                    ),
                    iconSize: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void alertCatYears(double cannang) {
    double ketQuaml = (cannang * 2.20462) / 2.5;
    double ketQuamg = (cannang * 2.20462);
    Alert(
      context: context,
      title: 'Cat Benadryl Dosage Calculator',
      image: Lottie.asset('acssets/iconAnimation/loaderCat.json'),
      content: Container(
          child: RichText(
        text: TextSpan(
          text: 'Với nồng độ:  ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: '${ketQuamg.toStringAsFixed(2)} mg',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorPinkFf758c())),
            const TextSpan(
                text: ' hoặc ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            TextSpan(
                text: '${ketQuaml.toStringAsFixed(2)} ml',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorPinkFf758c())),
            const TextSpan(
                text: ' an toàn với mèo của bạn',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            // TextSpan(text: getDays(dateTime, false), style: TextStyle(fontWeight: FontWeight.bold, color: colorPinkFf758c())),
          ],
        ),
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

  void alertInfo() {
    Alert(
      context: context,
      title: 'Thông tin',
      image: Lottie.asset('acssets/iconAnimation/search.json'),
      content: Container(
          child: Column(
        children: [
          Text(
            'Benadryl là gì và nó được sử dụng để làm gì?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Benadryl là một loại thuốc kháng histamine chủ yếu được sử dụng để làm giảm các triệu chứng của phản ứng dị ứng . Khi gặp các chất gây dị ứng cụ thể ( bụi , cỏ , nhựa , phấn hoa, nấm, v.v.), hệ thống miễn dịch của mèo có thể giải phóng histamine và các hóa chất khác, có thể gây ra các triệu chứng dị ứng, chẳng hạn như:'
            '\n - Hắt xì \n - Ho và thở khò khè \n - Da ngứa (gãi quá nhiều và chải đầu quá mức) \n - Nôn mửa và tiêu chảy \n - Đầy hơi và chướng bụng.'
            '\nThuốc kháng histamine, bao gồm Benadryl, làm giảm phản ứng của cơ thể với histamine và làm giảm bớt các triệu chứng nêu trên. Bên cạnh việc làm giảm các triệu chứng dị ứng, bác sĩ thú y có thể khuyên dùng Benadryl vì các lý do y tế khác , chẳng hạn như lo lắng và ngăn ngừa say tàu xe và buồn nôn.'
            '\nLưu ý rằng nếu mèo của bạn đang bị sốc phản vệ (phản ứng dị ứng nghiêm trọng được phân biệt bằng khó thở, sưng mặt, co giật hoặc suy sụp), Benadryl có thể không giúp được gì - bạn cần đưa mèo đến phòng khám thú y gần nhất ngay lập tức'
            '\n ---------',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          Text(
            'Benadryl có an toàn cho mèo không?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Mặc dù mèo nói chung có thể mắc bệnh Benadryl, nhưng bạn không bao giờ được cho mèo uống Benadryl mà không hỏi ý kiến ​​bác sĩ thú y để tránh các biến chứng nghiêm trọng về sức khỏe. Thuốc kháng histamine cho mèo không phải lúc nào cũng an toàn , đặc biệt là khi mèo của bạn có thể bị dị ứng với thuốc dị ứng. Dưới đây là một số biện pháp phòng ngừa bạn nên thực hiện để đảm bảo thú cưng quý giá của mình được điều trị an toàn:'
            '\n 💊 Tránh các viên nang dạng gel, có chứa dung môi (môi trường hòa tan) có thể gây kích ứng hoặc thậm chí có thể gây độc cho mèo.'
            '\n 💡 Chú ý đến thành phần hoạt tính của loại thuốc bạn mua. Nếu thuốc có chứa các hoạt chất khác ngoài diphenhydramine, bạn cần hỏi ý kiến ​​bác sĩ thú y.'
            '\n 🔎 Đảm bảo rằng mèo của bạn nhận được liều lượng chính xác theo trọng lượng chính xác của nó. Nếu nghi ngờ, bạn luôn có thể kiểm tra lại với bác sĩ thú y và kiểm tra ba lần bằng cách sử dụng máy tính liều lượng Benadryl cho mèo của chúng tôi!'
            '\n 🆘 Theo dõi hành vi của mèo và đảm bảo rằng nó không gặp bất kỳ tác dụng phụ bất lợi nào. Sẽ là tốt nhất nếu bạn chú ý đến'
            '\n   Hyperexcitability \n   Khô miệng, Buồn nôn \n   Giảm hứng thú với thức ăn \n   Giảm đi tiểu \n   Thuốc an thần  \n   Bệnh tiêu chảy'
            '\n 👩 Đảm bảo bạn có thể đến gặp bác sĩ thú y hoặc phòng khám thú y gần nhất để được giúp đỡ, trong trường hợp mèo của bạn gặp phải các tác dụng phụ bất lợi.',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          )
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
