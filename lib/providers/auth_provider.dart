import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:week9_authentication/api/firebase_auth_api.dart';

class UserAuthProvider with ChangeNotifier {
  late FirebaseAuthApi auth;
  late User? _user;
  late Stream<User?> _userStream;

  UserAuthProvider() {
    auth = FirebaseAuthApi();
  }

  
}