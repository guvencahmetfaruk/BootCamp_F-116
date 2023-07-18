import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void updateUserName(String newName) async {
    final user = this.user;
    if (user != null) {
      await user.updateDisplayName(newName);
      print('Kullanıcı adı güncellendi: $newName');
    }
  }

  Future<void> fetchProfile() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('WRbSKVgXCIxuvqS0a9tv', isEqualTo: 'WRbSKVgXCIxuvqS0a9tv')
        .get();

    for (var document in snapshot.docs) {
      // Belgeyi kullanma
      print('Document ID: ${document.id}, Data: ${document.data()}');
    }
  }

  Future<void> addUser(
    String name,
    String surname,
    String phone,
    String username,
  ) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name, // John Doe
          'surname': surname, // Stokes and Sons
          'phone': phone, // 42
          'username': username // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print(" Failed to add user: $error"));
  }


}
