import 'package:exam/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firestoreService.dart';

class AllService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users firebasedanFoydalanuvchi(User? user) {
    return Users(uid: user!.uid);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Xato Service signOUt funksiya : $e");
    }
  }

  Future signUpWithEmail(String email, String password, String phone) async {
    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = _credential.user!;


      await FirestoreService(uid: user.uid)
          .writeFirestore(email, phone, user.uid);

      return firebasedanFoydalanuvchi(user);
    } catch (e) {
      print("Service sign up function : $e");
    }
  }

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential _credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = _credential.user!;

      return firebasedanFoydalanuvchi(user);
    } catch (e) {
      print("Service sign in function : $e");
    }
  }
}
