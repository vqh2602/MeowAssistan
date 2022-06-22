import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meowassistan/bloc/register_bloc.dart';
import 'package:meowassistan/events/register_event.dart';
import 'package:meowassistan/screen/loginSignup/registerStatus.dart';
import 'package:meowassistan/states/register_state.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Color/colors.dart';
import '../../repository/userRepository.dart';
import '../../validators/validators.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/RegisterScreen';
  late UserRepository? userRepository;
  RegisterScreen({Key? key, this.userRepository}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyRegisterScreen();
  }
}

class _MyRegisterScreen extends State<RegisterScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerdisplayName = TextEditingController();

  late RegisterBloc _registerBloc;
  UserRepository? get userRepository => widget.userRepository;

  final bool _obscureText = true;
  bool check = false;

  bool get isPopUpdate =>
      textEditingControllerEmail.text.isNotEmpty &&
      textEditingControllerPassword.text.isNotEmpty &&
       textEditingControllerdisplayName.text.isNotEmpty ;
  bool isRegisterButtonEnable(RegisterState registerState) {
    print(
        'check:  pass: ${registerState.isValidPassword} & email: ${registerState.isValidEmail}'
        ' mail: ${textEditingControllerEmail.text} pass: ${textEditingControllerPassword.text}');
    if (registerState.isValidPassword &
            registerState.isValidEmail &
            isPopUpdate &&
        !registerState.isSubmitting) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    textEditingControllerEmail.addListener(() {
      _registerBloc.add(
          RegisterEventEmailChange(email: textEditingControllerEmail.text));
    });
    textEditingControllerPassword.addListener(() {
      _registerBloc.add(RegisterEventPasswordChange(
          password: textEditingControllerPassword.text));
    });
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, registerState) {
          if (registerState.isFailure) {
            print('regis fail');
            return RegisterStatus( status: 0,);
          }else if (registerState.isSuccess) {
            print('regis success');
            return  RegisterStatus( status: 1,);
          } else {
            return _safeArea(registerState, '');
          }
        },
      ),
    );
  }

  SafeArea _safeArea(RegisterState registerState, String title) {


    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      // padding: const EdgeInsets.only(left: 10, right: 10),
      // decoration: const BoxDecoration(
      //     // image: DecorationImage(
      //     //   image: AssetImage('acssets/images/logo/meow.png'),
      //     //   // fit: BoxFit.cover,
      //     // ),
      //
      //     ),
      child: Center(
        child: Form(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'acssets/images/cats/catfoot.png',
                        // width: 250,
                      )),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter'),
                            ),
                            Text(
                              'Please sign up to continue',
                              style: TextStyle(
                                  color: colorB3B3B3(),
                                  fontSize: 20,
                                  fontFamily: 'Inter'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(title,style: const TextStyle(color: Colors.red),),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: TextFormField(
                            controller: textEditingControllerdisplayName,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'displayName_check_null'.tr();
                              } else {
                                return null;
                              }

                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Ionicons.mail_outline,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colorPinkFf758c(), width: 2.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: colorPinkFf758c())),
                              labelText: 'displayName'.tr(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: TextFormField(
                            controller: textEditingControllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'email_check_null'.tr();
                              } else if (!isValidEmail(value)) {
                                return 'email_check'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Ionicons.mail_outline,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: colorPinkFf758c(), width: 2.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: colorPinkFf758c())),
                              labelText: 'input_email'.tr(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: textEditingControllerPassword,
                            keyboardType: TextInputType.visiblePassword,
                            autocorrect: false,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'pass_check_null'.tr();
                              } else if (!isValidPass(value)) {
                                return 'pass_check_val'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Ionicons.lock_closed_outline),
                              border: UnderlineInputBorder(),
                              labelText: 'input_pass'.tr(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: TextFormField(
                            obscureText: true,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'pass_check_null'.tr();
                              } else if (value != textEditingControllerPassword.text) {
                                return 'pass_check_pass'.tr();
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              border: UnderlineInputBorder(),
                              labelText: 'confirm_pass'.tr(),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  colorPinkFf758c(),
                                  colorPinkFf7eb3()
                                ]),
                                borderRadius: BorderRadius.circular(50),
                                // boxShadow: <BoxShadow>[
                                //   BoxShadow(
                                //       color: Color.fromRGBO(16, 142, 233, 0.57),
                                //       blurRadius: 13)
                                // ]
                              ),
                              child: InkWell(
                                onTap: () {
                                  isRegisterButtonEnable(registerState)?_onRegisterEmailAndPassword():null;
                                },
                                child: SizedBox(
                                  width: 230,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children:[
                                        Text(
                                          'register',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25),
                                        ).tr(),
                                        Icon(
                                          Ionicons.arrow_forward_outline,
                                          color: Colors.white,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'create_acc_done',
                        style: TextStyle(
                          color: colorB3B3B3(),
                          fontSize: 17,
                          fontFamily: 'Inter',
                        ),
                      ).tr(),
                      TextButton(
                          onPressed: () {
                            // Navigator.pushNamed(
                            //   context,
                            //   LoginScreen.routeName,
                            // );
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'sign_in',
                            style: TextStyle(
                                color: colorPinkFf758c(),
                                fontSize: 17,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700),
                          ).tr())
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  void _onRegisterEmailAndPassword(){
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text("Đăng kí thành công"),
    // ));
    Alert(context: context, title: "Thông Báo", desc: "Đang tạo tài khoản").show();
    print('nhạn mail va pass | isRegisterButtonEnable: $isRegisterButtonEnable | isPopUpdate: $isPopUpdate');
    _registerBloc.add(RegisterEventWithEmailAndPasswordPressed(
        email: textEditingControllerEmail.text,
        password: textEditingControllerPassword.text,
        displayName: textEditingControllerdisplayName.text));
    // Navigator.of(context).pop();
  }

}
