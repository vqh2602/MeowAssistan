import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:meowassistan/screen/loginSignup/loginScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Color/colors.dart';
import '../../bloc/authentication_bloc.dart';
import '../../bloc/user_bloc.dart';
import '../../events/authencation_event.dart';
import '../../events/user_event.dart';
import '../../repository/userRepository.dart';
import '../../states/user_state.dart';

class AccountScreen extends StatefulWidget {
  UserRepository userRepository;

  int rebuil = 0;
  AccountScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyAccountScreen();
  }
}

class _MyAccountScreen extends State<AccountScreen> {
  UserRepository? get userRepository => widget.userRepository;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late UserBloc _userBloc;
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _userBloc.add(GetUser(userRepository: userRepository!));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: colorPinkFf758c(),
          child: Padding(
            //left: 20, right: 20,
            padding: const EdgeInsets.only(top: 40),

            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                if (userState is UserStateFail) {
                  print('login fail');
                  return const SizedBox();
                } else if (userState is UserStateSuccess) {
                  print('login submit');
                  return body(
                      userState.user.displayName!,
                      userState.user.email,
                      userState.user.catcoin,
                      DateFormat('dd/MM/yyyy')
                          .format(userState.user.expirationDate!));
                } else {
                  return CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(colorPinkFf758c()),
                  );
                }
              },
            ),
          )),
    );
  }

  Widget body(String name, email, catcoin, expirationDate) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40, // Image radius
                  backgroundImage:
                      AssetImage('acssets/images/cats/catAvatar.jpg'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text(
                        'Hello, $name',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Colors.white),
                      ),
                      Text(
                        '$email',
                        style: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'Inter',
                            color: Colors.white),
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: (){
                          alertLogOut('Thông Báo', 'Bạn muốn đăng xuất chứ', email);
                          // context.read<AuthenticationBloc>().add(AuthenticationEventLogout());
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) => LoginScreen(userRepository: userRepository,)));
                        },
                        child:  const Icon(Icons.logout,color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 9,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage('acssets/images/cats/accountBackground.png'),
                  fit: BoxFit.fill,
                )),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.only(right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Ionicons.create_outline,
                            size: 40,
                            color: colorPinkFf758c(),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    '$catcoin',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 20,
                                        color: colorPinkFf758c(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    // color: Colors.black,
                                    child: Image.asset(
                                      'acssets/images/cats/catCoin.png',
                                    ),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                // width: 10,
                                height: 60,
                                // color: Colors.black,
                                child: Image.asset(
                                  'acssets/images/cats/accLine.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              )),
                          Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    '$expirationDate',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 20,
                                        color: colorPinkFf758c(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Padding(padding: EdgeInsets.all(3)),
                                  Text(
                                    'Ngày hết hạn',
                                    style: TextStyle(color: colorFCAFAD()),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    // dang ki
                    SizedBox(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorB3B3B3(),
                              ),
                              child: InkWell(
                                onTap: () {

                                  alertBuyCatCoin('Thông báo', 'Bạn có muốn mua dịch vụ này với giá 1000 catcoin?', catcoin,email,1000,24);


                                  //  Navigator.pushReplacement(
                                  //      context,
                                  //      MaterialPageRoute(
                                  //          builder: (BuildContext context) => super.widget)); //Recall the function again
                                },
                                child: buyCatCoin('acssets/images/cats/buy1day.png', '1 ngày', '1000','0%'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 0, bottom: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorB3B3B3(),
                              ),
                              child: InkWell(
                                onTap: () {
                                  alertBuyCatCoin('Thông báo', 'Bạn có muốn mua dịch vụ này với giá 6000 catcoin?', catcoin,email,6000,168);

                                  //  Navigator.pushReplacement(
                                  //      context,
                                  //      MaterialPageRoute(
                                  //          builder: (BuildContext context) => super.widget)); //Recall the function again
                                },
                                child: buyCatCoin('acssets/images/cats/buy7day.png', '7ngay', '6000','15%'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorB3B3B3(),
                              ),
                              child: InkWell(
                                onTap: () {
                                  alertBuyCatCoin('Thông báo', 'Bạn có muốn mua dịch vụ này với giá 23500 catcoin?', catcoin,email,23500,750);


                                },
                                child: buyCatCoin('acssets/images/cats/buy30day.png', '30 days', '23500','30%'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))),
      ],
    );
  }

  Widget buyCatCoin(String img,days,coin,tk){
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
            img),
        Column(
          children: [
            Text(
              days,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  color: colorPinkFf7eb3(),
                  fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$coin ",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  WidgetSpan(
                    child: Image.asset(
                      'acssets/images/cats/catCoin.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Tiết kiệm ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              // WidgetSpan(
              //   child: Image.asset(name),
              // ),
              TextSpan(
                text: tk,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> buyCatcoin(String email, int catcoinbuy, int hours) async {
    // await db.collection("users").get().then((event) {
    //   for (var doc in event.docs) {
    //     print("${doc.id} => ${doc.data()}");
    //   }};

    db.collection("users").where("email", isEqualTo: email).get().then(
      (res) async {
        int catcoinnew;
        DateTime dt;
        DateTime now = DateTime.now();

        // await db.collection("users").get().then((event) {
        //   for (var doc in event.docs) {
        //     print("tim thay user: ${doc.id} => ${doc.data()["email"]}");
        //     catcoinnew = doc.data()["catcoin"] + catcoin;

        final docRef = db.collection("users").doc(email);
        await docRef.get().then(
          (DocumentSnapshot doc) async {
            final data = doc.data() as Map<String, dynamic>;
            // ...
            catcoinnew = await data["catcoin"] - catcoinbuy;
            dt = data["expirationDate"].toDate();

            print('expirationDate : ${data["expirationDate"].toDate()} | catcoin new: $catcoinnew | newday: ${dt.add(const Duration(days: 1))}');

            if (dt.isAfter(now)) {
              final washingtonRef = db.collection("users").doc(email);
              washingtonRef.update({
                "catcoin": catcoinnew,
                "expirationDate": dt.add(Duration(hours: hours))
              }).then(
                  (value) =>
                      print("DocumentSnapshot successfully updated catcoin!"),
                  onError: (e) => print("Error updating document $e"));
            } else {
              final washingtonRef = db.collection("users").doc(email);
              washingtonRef.update({
                "catcoin": catcoinnew,
                "expirationDate": now.add(Duration(hours: hours))
              }).then(
                  (value) =>
                      print("DocumentSnapshot successfully updated catcoin!"),
                  onError: (e) => print("Error updating document $e"));
            }
          },
          onError: (e) => print("Error getting document: $e"),
        );
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  void ShowSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Không đủ tiền"),
    ));
  }

  void alertBuyCatCoin(String title, content, catcoin, email, int catcoinbuy, int timehour){

    Alert(
      context: context,
      title: title,
      desc: content,
      image: Lottie.asset('acssets/iconAnimation/catOk.json'),
      buttons: [
        DialogButton(
          child: const Text(
            "Huỷ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: const Text(
            "Mua",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            print('${catcoin.toInt()}');
            if(catcoin.toInt() > catcoinbuy-1){
              buyCatcoin(email, catcoinbuy, timehour);
              // reload
              // Go to Page2 after 5s.
              Future.delayed(const Duration(seconds: 3), () {
                context.read<UserBloc>().add(GetUser(
                    userRepository: userRepository!));
              });
            }else{
              Navigator.pop(context);
              ShowSnackbar();
            }

          },
          gradient: LinearGradient(colors: [
            colorPinkFf758c(),
            colorPinkFf7eb3()
          ]),
        )
      ],
    ).show();
  }

  void alertLogOut(String title, content,email){
    Alert(
      context: context,
      title: title,
      desc: content,
      image: Lottie.asset('acssets/iconAnimation/catSad.json'),
      buttons: [
        DialogButton(
          child: const Text(
            "Huỷ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context,'/',(_) => false);
            context.read<AuthenticationBloc>().add(AuthenticationEventLogout());

            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => LoginScreen(userRepository: userRepository,)));

          },
          gradient: LinearGradient(colors: [
            colorPinkFf758c(),
            colorPinkFf7eb3()
          ]),
        )
      ],
    ).show();
  }
}
