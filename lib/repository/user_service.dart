import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  User? user = FirebaseAuth.instance.currentUser;

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
}
