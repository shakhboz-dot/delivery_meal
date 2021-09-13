import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/model/favorite.dart';

class FavoriteService {
  final String? uidMeal;
  FavoriteService({this.uidMeal});

  final CollectionReference _reference =
  FirebaseFirestore.instance.collection("Favorites");

  Future writeFirestore(String image, String name1, String name2, String cost,int index,
      {bool state = false}) async {
    return await _reference.doc(uidMeal).set({
      'image': image,
      'name1': name1,
      'name2': name2,
      'cost': cost,
      'index': index,
      'state': state,
    });
  }

  Future deleteFirestore(String uidMeal) async {
    return await _reference
        .doc(uidMeal)
        .delete()
        .then((value) => print("Delete qilinde"))
        .catchError(
          (e) => print("Error $e"),
    );
  }

  List<Favorite> _addDatas(QuerySnapshot snap) {
    return snap.docs.map((doc) {
      return Favorite(
        image: doc['image'],
        name1: doc['name1'],
        name2: doc['name2'],
        cost: doc['cost'],
        index: doc['index'],
        state: doc['state'],
      );
    }).toList();
  }

  Stream<List<Favorite>>? get orders {
    return _reference.snapshots().map(_addDatas);
  }
}
