import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isAuthenticated = false.obs;

  User? get user => _auth.currentUser;
  var obscureText = true.obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      isAuthenticated.value = user != null;
      if (user != null) {
        Get.offAllNamed('/');
      }
    });
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isAuthenticated(true);
      Get.offAllNamed('/');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void register(String name, String email, String phone, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.updateDisplayName(name);
      isAuthenticated(true);
      Get.offAllNamed('/');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void logout() async {
    await _auth.signOut();
    isAuthenticated(false);
    Get.offAllNamed('/login');
  }
}
