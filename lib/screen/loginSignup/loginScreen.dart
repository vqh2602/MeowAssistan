import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meowassistan/bloc/authentication_bloc.dart';
import 'package:meowassistan/bloc/login_bloc.dart';
import 'package:meowassistan/bloc/register_bloc.dart';
import 'package:meowassistan/events/authencation_event.dart';
import 'package:meowassistan/events/login_event.dart';
import 'package:meowassistan/repository/userRepository.dart';
import 'package:meowassistan/screen/loginSignup/registerScreen.dart';
import 'package:meowassistan/states/login_state.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Color/colors.dart';
import '../../validators/validators.dart';
import 'loginScreenMin.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';
  late UserRepository? userRepository;
  LoginScreen({Key? key, this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyLoginScreen();
  }
}

class _MyLoginScreen extends State<LoginScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  late LoginBloc _loginBloc;
  UserRepository? get userRepository => widget.userRepository;

  final bool _obscureText = true;

  bool get isPopUpdate =>
      textEditingControllerEmail.text.isNotEmpty &&
      textEditingControllerPassword.text.isNotEmpty;
  bool isLoginButtonEnable(LoginState loginState) {
    print('check: ${loginState.isValidEmail}  & ${loginState.isValidPassword}'
        ' mail: ${textEditingControllerEmail.text} pass: ${textEditingControllerPassword.text}');
    if(loginState.isValidPassword && loginState.isValidEmail && isPopUpdate &&
        !loginState.isSubmitting){
      return true;
    }else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    textEditingControllerEmail.addListener(() {
      _loginBloc.add(LoginEventEmailChange(email: textEditingControllerEmail.text));
    });
    textEditingControllerPassword.addListener(() {
      _loginBloc.add(LoginEventPasswordChange(password: textEditingControllerPassword.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState) {
          if (loginState.isFailure) {
            print('login fail');
            return _safeArea(loginState,'Tài khoản hoặc mật khẩu không đúng, \n hoặc không có kết nối mạng');
          } else if (loginState.isSuccess) {
            BlocProvider.of<AuthenticationBloc>(context)
                .add(AuthenticationEventLogin());
            return LoginStatus(status: 1,userRepository: userRepository!,);
          } else {
            return _safeArea(loginState,'');
          }
        },
      ),
    );
  }

  SafeArea _safeArea(LoginState loginState,String title){
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
                                'Login',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              Text(
                                'Please sign in to continue',
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
                              // focusNode: FocusNode(),
                              controller: textEditingControllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email.';
                                } else if (!isValidEmail(value)) {
                                  return 'Please use the @ email.';
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
                                    borderSide: BorderSide(
                                        color: colorPinkFf758c())),
                                labelText: 'Enter your email',
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
                              validator: (_) {
                                return loginState.isValidPassword
                                    ? null
                                    : 'Email sai định dạng';
                              },
                              decoration: const InputDecoration(
                                prefixIcon:
                                Icon(Ionicons.lock_closed_outline),
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your password',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
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
                                    _onLoginEmailAndPassword();
                                  },
                                  child: SizedBox(
                                    width: 170,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'LOGIN ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25),
                                          ),
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
                          'Dont have an account?',
                          style: TextStyle(
                            color: colorB3B3B3(),
                            fontSize: 17,
                            fontFamily: 'Inter',
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   RegisterScreen.routeName,
                              //   arguments: {'userRegistory': userRepository}
                              // );
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                 return BlocProvider<RegisterBloc>(
                                 create: (context)=> RegisterBloc(userRepository: userRepository),
                                   child: RegisterScreen(userRepository: userRepository),
                                 );
                                })
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: colorPinkFf758c(),
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  void _onLoginEmailAndPassword(){

    print('nhạn mail va pass | isLoginButtonEnable: ${isLoginButtonEnable} | isPopUpdate: $isPopUpdate');
    _loginBloc.add(LoginEventWithEmailAndPasswordPressed(email: textEditingControllerEmail.text,
    password: textEditingControllerPassword.text));
    // _userBloc.add(GetUser(user: null));

  }
}
