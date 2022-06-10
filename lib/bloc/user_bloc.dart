import 'package:bloc_concurrency/bloc_concurrency.dart';
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
            final docRef =await db.collection("users").doc(user.email);
            await docRef.get().then(
                  (DocumentSnapshot doc) async {
                final data = doc.data() as Map<String, dynamic>;
                // ...
          userCustom = UserCustom(displayName: data["displayName"], email: user.email,catcoin: data["catcoin"], expirationDate: data["expirationDate"].toDate());
                        print("in customusser: ${userCustom.displayName}");
                        await Future.delayed(Duration(seconds: 1));
                        emit(UserStateSuccess(user: await userCustom));
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