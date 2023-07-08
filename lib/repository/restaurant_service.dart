import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantService {
  final CollectionReference restaurantCollection = FirebaseFirestore.instance.collection("Restaurants");
  Future<List<DocumentSnapshot>> getRestaurants() async {
    try {
      QuerySnapshot querySnapshot = await restaurantCollection.get();
      return querySnapshot.docs;
    } catch (error) {
      print('Restoranları alma hatası: $error');
      return [];
    }
  }
}
