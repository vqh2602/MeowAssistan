import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Color/colors.dart';
import '../../bloc/user_bloc.dart';
import '../../repository/userRepository.dart';
import '../home/homeScreen.dart';


class SplashScreen extends StatefulWidget {
  UserRepository userRepository;

  SplashScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MySplashScreen();
  }
}

class _MySplashScreen extends State<SplashScreen> {
  UserRepository get userRepository => widget.userRepository;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _userBloc = BlocProvider.of<UserBloc>(context);
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen(userRepository: widget.userRepository,)));
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:Container(
            width: double.infinity,
            height: double.infinity,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 25)),
                        Image.asset(
                          'acssets/images/logo/meow.png',
                          width: 200,
                          height: 200,
                        ),
                        GradientText(
                          'Meow Assistan',
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                          colors: [
                            colorPinkFf758c(),
                            colorPinkFf7eb3()
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 25)),
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(colorPinkFf758c()),
                        )
                      ],
                    )),
                SizedBox(
                  child: Column(
                    children: [
                      Text('from',style: TextStyle(color: Colors.grey),),
                      Image.asset(
                        'acssets/images/logo/logo_vqh_apps.png',
                        width: 50,
                        height: 50,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 25)),
                    ],
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
