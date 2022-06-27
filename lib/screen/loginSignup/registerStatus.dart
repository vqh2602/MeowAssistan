import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterStatus extends StatefulWidget{
  late int status;
  RegisterStatus({Key? key, required this.status}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _myRegisterStatus();
  }

}

class _myRegisterStatus extends State<RegisterStatus>{
  int get status => widget.status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('status $status');
    // if (status == 1) {
    //   // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   //   content: Text("Đăng kí that bai"),
    //   // ));
    //   // Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
    //   //     .show();
    //
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text("Đăng kí thành công"),
    //   ));
    // }else{
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text("Đăng kí thất bại"),
    //   ));
    // }
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pop();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (status == 1 )? const Center(child: Text(' Đăng kí thành công'),) : const Center(child: Text('Đăng kí thất bại'),);
  }

}