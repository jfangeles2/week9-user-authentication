import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:week9_authentication/api/firebase_auth_api.dart';

class UserAuthProvider with ChangeNotifier {
  late FirebaseAuthApi authService;
  late Stream<User?> _userStream;

  User? get user => authService.getUser();
  Stream<User?> get userStream => _userStream;

  UserAuthProvider() {
    authService = FirebaseAuthApi();
    fetchAuthentication();
  }

  void fetchAuthentication() {
    _userStream = authService.fetchUser();

    notifyListeners();
  }

  Future<String> signUp(String email, String password) async {
    String msg = await authService.signUp(email, password);
    notifyListeners();
    return msg;
  }

  Future<String> signIn(String email, String password) async {
    String msg = await authService.signIn(email, password);
    notifyListeners();
    return msg;
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
