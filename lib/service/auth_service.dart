// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class RegisterService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool checkUserLoggedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print('Kullanıcı giriş yapmış durumda: ${user.email}');
      return true;
    } else {
      print('Kullanıcı giriş yapmamış durumda.');
      return false;
    }
  }

  Future<bool> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      String userUId = user!.uid.toString();

      print('Kullanıcı oluşturuldu: $userUId');
      return true;
    } catch (e) {
      print('Hesap oluşturulamadı: $e');
      return false;
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Kullanıcı giriş yaptı: ${userCredential.user!.email}');
    } catch (e) {
      print('Hata: $e');
    }
  }

  void signOutUser() {
    FirebaseAuth.instance.signOut();
    print('Kullanıcı oturumu kapattı.');
  }
}
