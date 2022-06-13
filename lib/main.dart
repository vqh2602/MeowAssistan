import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meowassistan/bloc/authentication_bloc.dart';
import 'package:meowassistan/bloc/cat_bloc.dart';
import 'package:meowassistan/bloc/login_bloc.dart';
import 'package:meowassistan/bloc/user_bloc.dart';
import 'package:meowassistan/models/hive_Models/database/cat_db.dart';
import 'package:meowassistan/repository/userRepository.dart';
import 'package:meowassistan/screen/healCat/catScreen.dart';

import 'package:meowassistan/screen/loginSignup/loginScreen.dart';
import 'package:meowassistan/screen/loginSignup/registerScreen.dart';
import 'package:meowassistan/screen/splash/splashScreen.dart';
import 'package:meowassistan/screen/utilities/utilitiesScreen.dart';
import 'package:meowassistan/states/authencation_state.dart';
import 'package:sizer/sizer.dart';


import 'bloc/bmi_bloc.dart';
import 'bloc/register_bloc.dart';
import 'bloc/simple_bloc_observer.dart';
import 'events/authencation_event.dart';
import 'events/cat_event.dart';
import 'firebase_options.dart';
import 'models/hive_Models/bmi.dart';
import 'models/hive_Models/cats.dart';
import 'models/hive_Models/database/bmi_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<Cat>(CatAdapter());
  await Hive.openBox<Cat>("Catdb");
  Hive.registerAdapter<BMI>(BMIAdapter());
  await Hive.openBox<BMI>("BMIdb");

  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final UserRepository _userRepository = UserRepository();

  BlocOverrides.runZoned(
    () {
      // final userRepository = UserRepository();
      // userRepository.createUserWithEmailAndPassword('vqh@aaa.com', '12345678');
      runApp(
          MultiBlocProvider(
            providers: [
              BlocProvider<UserBloc>(
                create: (BuildContext context) => UserBloc(userRepository: _userRepository),
              ),
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext context) => AuthenticationBloc(userRepository: _userRepository),
              ),
              BlocProvider<LoginBloc>(
                create: (BuildContext context) => LoginBloc(userRepository: _userRepository),
              ),
              BlocProvider<CatBloc>(
                create: (BuildContext context) => CatBloc(catDatabase: CatDatabase()),
              ),
              BlocProvider<BMIBloc>(
                create: (BuildContext context) => BMIBloc(bmiDatabase:BMIDatabase()),
              ),
            ],
            child: MyApp(userRepository: _userRepository,),
          ));
    },
    blocObserver: SimpleBlocObserver(),
  );

  // final userRepository = UserRepository();
  // userRepository.createUserWithEmailAndPassword('vqh@aaa.com', '123456');
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository? userRepository;

  const MyApp({Key? key,this.userRepository}) : super(key: key);

  static const MaterialColor mcgpalette0 =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFFFF3F3),
    100: Color(0xFFFFE1E2),
    200: Color(0xFFFFCDCF),
    300: Color(0xFFFFB8BB),
    400: Color(0xFFFFA9AD),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFFFF9296),
    700: Color(0xFFFF888C),
    800: Color(0xFFFF7E82),
    900: Color(0xFFFF6C70),
  });
  static const int _mcgpalette0PrimaryValue = 0xFFFF9A9E;

  static const MaterialColor mcgpalette0Accent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFF5F5),
  });
  static const int _mcgpalette0AccentValue = 0xFFFFFFFF;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<CatBloc>(context).add(CatInitialEvent());
    return Sizer(builder: (context, orientation, deviceType) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: mcgpalette0,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/LoginScreen': (BuildContext context) => LoginScreen(),
        '/RegisterScreen': (BuildContext context) => RegisterScreen(),
      },
     // home:  UtilitiesScreen(),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(userRepository: userRepository!)
          ..add(AuthenticationEventStarted()),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authenticationState) {

            if (authenticationState is AuthenticationStateSuccess) {

              return BlocProvider<UserBloc>(
                create: (BuildContext context) => UserBloc(userRepository: userRepository),
                child: SplashScreen( userRepository: userRepository!,),
                  //SplashScreen( userRepository: _userRepository,),
              );
            } else if (authenticationState is AuthenticationStateFailure) {

              return BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(userRepository: userRepository!),
                child: LoginScreen(userRepository: userRepository),
              );
            } else {

              return BlocProvider<RegisterBloc>(
                  create: (context) =>
                      RegisterBloc(userRepository: userRepository),
                  child: RegisterScreen(userRepository: userRepository));
            }
          },
        ),
      ),
    ));
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the states. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
