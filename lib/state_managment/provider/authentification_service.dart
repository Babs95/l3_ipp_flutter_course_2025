import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:l3_ipp_app/models/my_user_model.dart';
import 'package:provider/provider.dart';

class AuthentificationService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  MyUserModel? _myUserModel;

  User? get user => _user;
  MyUserModel? get myUserModel => _myUserModel;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  AuthentificationService() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> setMyUser(MyUserModel? user) async {
    _myUserModel = user;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Provider.of<AuthentificationService>(context, listen: false).setMyUser(null);
  }
}
