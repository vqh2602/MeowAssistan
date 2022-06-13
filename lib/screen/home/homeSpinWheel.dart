import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Color/colors.dart';
import '../../admod/admod.dart';
import '../../bloc/user_bloc.dart';
import '../../events/user_event.dart';
import '../../repository/userRepository.dart';
import '../../states/user_state.dart';

class HomeSpinWheel extends StatefulWidget {
  UserRepository userRepository;

  HomeSpinWheel({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //
    return _MyHomeSpinWheel();
  }
}

class _MyHomeSpinWheel extends State<HomeSpinWheel> {
  // final StreamController _dividerController = StreamController<int>();
  UserRepository? get userRepository => widget.userRepository;
  late UserBloc _userBloc;
  StreamController<int> selected = StreamController<int>();
  int index = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(GetUser(userRepository: userRepository!));

    print('init');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    final items = <int>[
      10,
      100,
      35,
      500,
      25,
      250,
      50,
      300,
      150,
      75,
      200,
      5,
    ];

    FirebaseFirestore db = FirebaseFirestore.instance;
    // final user = <String, dynamic>{
    //   "first": "Ada",
    //   "last": "Lovelace",
    //   "born": 1815
    // };
    // // Add a new document with a generated ID
    // db.collection("users").add(user).then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));

    // final city = <String, String>{
    //   "name": "Los Angeles",
    //   "state": "CA",
    //   "country": "USA"
    // };
    //
    // db.collection("cities")
    //     .doc("LA")
    //     .set(city)
    //     .onError((e, _) => print("Error writing document: $e"));

    Future<void> printUser(String email, int catcoin) async {
      // await db.collection("users").get().then((event) {
      //   for (var doc in event.docs) {
      //     print("${doc.id} => ${doc.data()}");
      //   }};

      db.collection("users").where("email", isEqualTo: email).get().then(
            (res) async {
              int catcoinnew =0;

              // await db.collection("users").get().then((event) {
              //   for (var doc in event.docs) {
              //     print("tim thay user: ${doc.id} => ${doc.data()["email"]}");
              //     catcoinnew = doc.data()["catcoin"] + catcoin;

              final docRef =db.collection("users").doc(email);
              await docRef.get().then(
                    (DocumentSnapshot doc) async {
                  final data = doc.data() as Map<String, dynamic>;
                  // ...
                      catcoinnew = data["catcoin"] + catcoin;

                  // cạp nhat catcoin
                  final washingtonRef = db.collection("users").doc(email);
                  washingtonRef.update({"catcoin": catcoinnew}).then(
                          (value) => print("DocumentSnapshot successfully updated catcoin!"),
                      onError: (e) => print("Error updating document $e"));

                },
                onError: (e) => print("Error getting document: $e"),
              );
            },
            onError: (e) => print("Error completing: $e"),
          );
    }
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    //
    // Future<void> addUser() {
    //   // Call the user's CollectionReference to add a new user
    //   return users
    //       .add({
    //     'email': 'vqh2602@gmail.com', // John Doe
    //     'catcoin': 0, // Stokes and Sons
    //     'date': '4/8/2022' // 42
    //   })
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Vòng Quay Kiếm Xu'),
        // ),
        body: SafeArea(
      child: GestureDetector(
        onTap: () {
          // setState(() {
          //   selected.add(
          //     Fortune.randomInt(0, items.length),
          //   );
          //
          // });
        },
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Vòng Quay Nhận Xu',
                  style: TextStyle(
                    fontSize: 25,
                    color: colorPinkFf758c(),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: (index >= 0)
                  ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bạn đã trúng: ${items[index]} ',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
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
                      ),
                    )
                  : const Center(
                      child: Text('Quay nào'),
                    ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FortuneWheel(
                  selected: selected.stream,
                  items: [
                    for (var it in items)
                      FortuneItem(
                          child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$it ',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
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
                        ),
                      )),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 0,
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(bottom: 30),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorPinkFf758c(),
                        colorPinkFf7eb3(),
                      ],
                    ),
                  ),
                  child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                    if(userState is UserStateSuccess){
                      return  InkWell(
                        onTap: () {
                          // chạy ads

                          // createInterstitialAd();
                          // showInterstitialAd();
                          createRewardedAd();
                          if( showRewardedAd()){
                            setState(() {
                              // Here you can write your code for open new view
                              var rendomval = Fortune.randomInt(0, items.length);
                              setState(() {
                                selected.add(rendomval);
                                Future.delayed(const Duration(milliseconds: 4500),
                                        () {
                                      setState(() {
                                        index = rendomval;
                                        // addUser();
                                        printUser(userState.user.email!,items[index] );
                                      });
                                    });
                              });
                            });
                          }
                          else{
                            print("đong quang cao som");
                          }
                        },
                        child: const Center(
                          child: Text(
                            'SPIN',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                color: Colors.white),
                          ),
                        ),
                      );
                    }else {
                      return Container();
                    }
                  }),
                ))
          ],
        ),
      ),
    ));
  }
}


