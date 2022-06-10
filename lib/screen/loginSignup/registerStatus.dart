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
    //   Alert(
    //     context: context,
    //     type: AlertType.error,
    //     title: "RFLUTTER ALERT",
    //     desc: "Flutter is more awesome with RFlutter Alert.",
    //     buttons: [
    //       DialogButton(
    //         child: const Text(
    //           "COOL",
    //           style: TextStyle(color: Colors.white, fontSize: 20),
    //         ),
    //         onPressed: () => Navigator.pop(context),
    //         width: 120,
    //       )
    //     ],
    //   ).show();
    // }else{
    //   Alert(
    //     context: context,
    //     type: AlertType.error,
    //     title: "RFLUTTER ALERT",
    //     desc: "loi dang ki",
    //     buttons: [
    //       DialogButton(
    //         child: const Text(
    //           "COOL",
    //           style: TextStyle(color: Colors.white, fontSize: 20),
    //         ),
    //         onPressed: () => Navigator.pop(context),
    //         width: 120,
    //       )
    //     ],
    //   ).show();
    // }
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pop();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (status == 1 )? Center(child: Text('Đăng kí thành công, sẽ từ trở về trang đăng nhập sau 5 giây'),) : Center(child: Text('Đăng kí thất bại'),);
  }

}