import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cookapp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Usuario _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? Usuario(uid: user.uid) : null;
  }

  Stream<Usuario> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
  //sign in anon

  Future registerPerson(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
