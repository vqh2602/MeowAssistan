

import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserRepository();

  Future<UserCredential> signInWithEmailAnPassword(
      String email, password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(String email, password) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut()async {
    _firebaseAuth.signOut();
  }

  Future<bool> isSignIn() async{
    return _firebaseAuth.currentUser != null;
  }

  Future<User> getUser() async{
    return _firebaseAuth.currentUser!;
  }


}
