import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/shared/helper/route.dart';

import '../shared/constants/constants.dart';
import '../view/widgets/snackbar.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  Future<void> login(String email, String password) async {
    try {
      updateLoader(true);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to the home page
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
        createHomeRoute(),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again later.';
      if (e.code == 'invalid-credential' || e.code == 'user-not-found') {
        errorMessage = 'Invalid login credentials.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      }
      customSnackBar(appNavigatorKey.currentContext!, errorMessage);
    } finally {
      updateLoader(false);
    }
  }

  Future<void> signup(String name, String email, String password) async {
    try {
      updateLoader(true);
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        await addUserToFirestore(name, email);

        customSnackBar(appNavigatorKey.currentContext!,
            Constants.accountCreatedSucessfullyText);
        // Navigate to the login page

        Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createLoginRoute(),
          (Route<dynamic> route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again later.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists with $email.';
      }
      customSnackBar(appNavigatorKey.currentContext!, errorMessage);
    } catch (e) {
      customSnackBar(appNavigatorKey.currentContext!, 'Failed: $e');
    } finally {
      updateLoader(false);
    }
  }

  Future<void> addUserToFirestore(String name, String email) async {
    final users =
        FirebaseFirestore.instance.collection(Constants.collectionName);
    await users.add({
      Constants.nameText: name,
      Constants.emailText: email,
    });
  }

  void logout() {
    notifyListeners();
  }

  void updateLoader(bool status) {
    _loading = status;
    notifyListeners();
  }
}
