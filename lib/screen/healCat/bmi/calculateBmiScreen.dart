import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../Color/colors.dart';

class CalculateBmiScreen extends StatelessWidget{

  CalculateBmiScreen({Key? key ,required this.ribCage,required this.legLength}) : super(key: key);
  double ribCage,legLength;

  @override
  Widget build(BuildContext context) {
    double value = (((ribCage/0.7062) - legLength )/0.9156) - legLength;
    print(value);
    Color _colors (double num){
      if(num <15.1){
        return Colors.red;
      }else if( num >15 && num < 30){
        return Colors.green;
      }else if( num > 29.9  && num <42.1){
        return Colors.yellow;
      }else if( num > 42 && num < 60.1){
        return Colors.orange;
      }return Colors.red;
    }
    String _textbmi (double num){
      if(num <15.1){
        return 'Thiếu cân';
      }else if( num >15 && num < 30){
        return 'Bình thường';
      }else if( num > 29.9  && num <42.1){
        return 'Thừa cân';
      }else if( num > 42 && num < 60.1){
        return 'Béo phì';
      }return 'Cục mỡ';
    }

    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child:Center(
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child:  InkWell(
                            onTap: () {
                              Alert(
                                  context: context,
                                  title: "Làm thế nào để giúp mèo của bạn giảm cân?",
                                  desc: "1, Cắt giảm các món ăn. Hầu hết mèo cũng sẽ đánh giá cao những phần thưởng khác, bao gồm cả thời gian chơi với bạn!"
                                      "\n2, Nếu bạn muốn giữ các món ăn, hãy giảm nhẹ lượng thức ăn bình thường. Tuy nhiên, đừng bao giờ bỏ đói con mèo của bạn. Chế độ ăn kiêng sụp đổ không hoạt động tốt cho cả người và vật nuôi. Nếu bạn là một con mèo, bạn sẽ không thích điều này, phải không?"
                                      "\n3, Thay thế thực phẩm khô bằng đóng hộp, có xu hướng có hàm lượng carbohydrate và protein cao hơn. Điều này sẽ giữ cho con mèo của bạn no lâu hơn. Nó cũng sẽ ngăn chặn chăn thả - thức ăn khô cho mèo có thể chỉ là những gì khoai tây chiên (hoặc đồ ăn nhẹ khác) đối với chúng ta!"
                                      "\n4, Chơi với con mèo của bạn. Bạn có thể nghĩ về nó như một bài tập dễ chịu cho người bạn lông xù của bạn và một cách để đốt cháy lượng calo dư thừa."
                                      "\n5, Nếu bạn có hai con mèo (hoặc nhiều hơn), bạn có thể phải cho con thừa cân ăn trong một phòng riêng biệt hoặc giữ thức ăn của con mèo có trọng lượng khỏe mạnh ở một nơi ngoài tầm với của con mèo lớn hơn."
                                      "\n* Lưu ý: Hãy nhớ rằng đây chỉ là một hướng dẫn. Có thể có nhiều nguyên nhân khác nhau của trọng lượng quá mức, vì vậy hãy luôn đảm bảo tham khảo ý kiến bác sĩ thú y của bạn để loại trừ các tình trạng nghiêm trọng hơn. Bạn cũng có thể kiểm tra lượng calo của mèo để biết nó cần bao nhiêu thức ăn. Có thể khó giữ cho mèo cắt tỉa, đặc biệt là nếu chúng thích ở trong nhà, nhưng nó chắc chắn đáng để nỗ lực!"
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
                      )),
                  Text('Cat BMI: ${_textbmi(value)}'),
                  Text('${value.toStringAsFixed(2)}', style: TextStyle(color: colorPinkFf758c(), fontSize: 30, fontFamily: 'Inter',fontWeight: FontWeight.bold),),
                  SfLinearGauge(
                    minorTicksPerInterval: 1,
                    useRangeColorForAxis: true,
                    animateAxis: true,
                    axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
                    markerPointers: [
                      LinearShapePointer(value: value, height: 25, width: 25, color: _colors(value))
                    ],
                    ranges: const <LinearGaugeRange>[
                      LinearGaugeRange(
                          startValue: 0,
                          endValue: 15,
                          position: LinearElementPosition.outside,
                          color: Colors.red),
                      LinearGaugeRange(
                          startValue: 15.1,
                          endValue: 29.9,
                          position: LinearElementPosition.outside,
                          color: Colors.green),
                      LinearGaugeRange(
                          startValue: 30,
                          endValue: 42,
                          position: LinearElementPosition.outside,
                          color: Colors.yellow),
                      LinearGaugeRange(
                          startValue: 42.1,
                          endValue: 60,
                          position: LinearElementPosition.outside,
                          color: Colors.orange),
                      LinearGaugeRange(
                          startValue: 60.1,
                          endValue: 100,
                          position: LinearElementPosition.outside,
                          color: Colors.red),
                    ],
                  )
                ],
              ),
            )
        )
      ),
    );
  }


}