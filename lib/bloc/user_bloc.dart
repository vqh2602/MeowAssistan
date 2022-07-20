import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meowassistan/events/user_event.dart';
import 'package:meowassistan/models/user.dart';
import 'package:meowassistan/states/user_state.dart';

import '../repository/userRepository.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  //LoginBloc(LoginState initialState) : super(initialState);
  UserRepository? userRepository;

  UserBloc({this.userRepository}) : super(UserStateInitial())
  {
    on<GetUser>(_onGetUser);
    on<getAdLimted>(_onGetAdLimited);
  }

void _onGetUser(
    GetUser event, Emitter emit) async {
  try{
    User user = await event.userRepository.getUser();
    print('test get usser: ${await userRepository!.getUser()}');
    print('chay event thanh cong');

    FirebaseFirestore db = FirebaseFirestore.instance;
    UserCustom userCustom;
   await db.collection("users").where("email", isEqualTo: user.email).get().then(
          (res) async {

            // await db.collection("users").doc(user.email).get().then((event) async {
            //   for (var doc in event.docs) {
            //     print("tim thay user: ${doc.id} => ${doc.data()["email"]}");
            //     userCustom = UserCustom(displayName: doc.data()["displayName"], email: user.email,catcoin: doc.data()["catcoin"], expirationDate: doc.data()["expirationDate"].toDate());
            //     print("in customusser: ${userCustom.displayName}");
            //     await Future.delayed(Duration(seconds: 1));
            //     emit(UserStateSuccess(user: await userCustom));
            //   }
            // }, onError: (e) {
            //   return 'loi lay du lieu' as String;
            // });
            final docRef =db.collection("users").doc(user.email);
            await docRef.get().then(
                  (DocumentSnapshot doc) async {
                final data = doc.data() as Map<String, dynamic>;
                // ...
          userCustom = UserCustom(displayName: data["displayName"], email: user.email,catcoin: data["catcoin"], expirationDate: data["expirationDate"].toDate(),adToday: data["adToday"].toDate(), adLimited: data["adLimited"]);
                        print("in customusser: ${userCustom.displayName}");
                        await Future.delayed(const Duration(seconds: 1));
                        emit(UserStateSuccess(user: userCustom));
              },
              onError: (e) => print("Error getting document: $e"),
            );


          });

  }catch(_){
    // User user = await event.userRepository.getUser();
    // print('test get usser: ${await userRepository!.getUser()}');
    print('chay event that bai');
    //
    //
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // UserCustom userCustom;
    // await db.collection("users").where("email", isEqualTo: user.email).get().then(
    //         (res) async {
    //       await db.collection("users").get().then((event) async {
    //         for (var doc in event.docs) {
    //           print("tim thay user: ${doc.id} => ${doc.data()["email"]}");
    //           userCustom = UserCustom(displayName: user.displayName, email: user.email,catcoin: doc.data()["catcoin"], expirationDate: doc.data()["expirationDate"]);
    //           print("in customusser: $userCustom");
    //           await Future.delayed(Duration(seconds: 1));
    //           // emit(UserStateSuccess(user: await userCustom));
    //         }
    //       }, onError: (e) {
    //         return 'loi lay du lieu' as String;
    //       });
    //     });

    emit(UserStateFail());
  }
}
  }


void _onGetAdLimited(getAdLimted event, Emitter emit) async{
  emit(UserStateInitial());
  UserCustom userCustom;
  FirebaseFirestore db = FirebaseFirestore.instance;
  User user = await event.userRepository.getUser();
  db.collection("users").where("email", isEqualTo: user.email).get().then(
        (res) async {


      final docRef =db.collection("users").doc(user.email);
      await docRef.get().then(
            (DocumentSnapshot doc) async {
          final data = doc.data() as Map<String, dynamic>;
          // ...
          final difference = DateTime.now().difference(await data["adToday"].toDate());
          // print(difference.inDays);
          if(difference.inHours>23){
            // cạp nhat ad
            final washingtonRef = db.collection("users").doc(user.email);
            washingtonRef.update({"adToday": DateTime.now()}).then(
                    (value) => print("DocumentSnapshot successfully updated catcoin!"),
                onError: (e) => print("Error updating document $e"));
            washingtonRef.update({"adLimited": 0}).then(
                    (value) => print("DocumentSnapshot successfully updated catcoin!"),
                onError: (e) => print("Error updating document $e"));



          }


        },
        onError: (e) => print("Error getting document: $e"),
      );
    },
    onError: (e) => print("Error completing: $e"),
  );
}