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

  Stream<User?> fetchUser() {
    return auth.authStateChanges();
  }

  Future<String> signUp(String email, String password) async {
    try {
      UserCredential credentials = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print(credentials);
      return "Success!";
    } on FirebaseException catch (e) {
      print('Error 001: ${e.code} : ${e.message}');
      return ('Something went wrong :(');
    } catch (e) {
      print('Error 002: $e');
      return ('Something went wrong :(');
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      UserCredential credentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      print(credentials);
      return "Success!";
    } on FirebaseException catch (e) {
      print('Error 001: ${e.code} : ${e.message}');
      return ('Something went wrong :(');
    } catch (e) {
      print('Error 002: $e');
      return ('Something went wrong :(');
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
