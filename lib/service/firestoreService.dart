import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/model/client.dart';

class FirestoreService {
  final String? uid;
  FirestoreService({this.uid});

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection("User");

  Future writeFirestore(String email, String phone, String userId,
      {bool state = false}) async {
    return await _reference.doc(uid).set({
      'email': email,
      'phone': phone,
      'userId': userId,
      'state': state,
    });
  }


  List<Client> _addDatas(QuerySnapshot snap) {
    return snap.docs.map((doc) {
      return Client(
        email: doc['email'],
        phone: doc['phone'],
        userId: doc['userId'],
        state: doc['state'],
      );
    }).toList();
  }

  Stream<List<Client>> get orders {
    return _reference.snapshots().map(_addDatas);
  }
}
