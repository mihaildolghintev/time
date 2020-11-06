import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class LocalUser {
  LocalUser({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Future<LocalUser> currentUser();
  Future<LocalUser> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  LocalUser _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return LocalUser(uid: user.uid);
  }

  Stream<LocalUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<LocalUser> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<LocalUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    final user = authResult.user;
    return _userFromFirebase(user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
