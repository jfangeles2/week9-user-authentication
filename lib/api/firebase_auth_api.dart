import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthApi {

  late FirebaseAuth auth;

  FirebaseAuthApi() {
    auth = FirebaseAuth.instance;
    fetchUser();
  }

  User? getUser() {
    return auth.currentUser;
  }

  Future<Stream<User?>> fetchUser() async {
    return auth.authStateChanges();
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential credentials = await auth.signInWithEmailAndPassword(email: email, password: password);

      print(credentials);
    } on FirebaseException catch(e) {
      print('Error 001: ${e.code} : ${e.message}');
    } catch(e) {
      print('Error 002: $e');
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}