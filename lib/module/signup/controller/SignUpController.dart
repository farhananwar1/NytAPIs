import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geekinn_test/module/login/view/screen/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;

  singUp(context, name, email, password) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userName");
    prefs.remove("userEmail");
    prefs.remove("userPassword");
    prefs.setString('userName', jsonEncode(name));
    prefs.setString('userEmail', jsonEncode(email));
    prefs.setString('userPassword', jsonEncode(password));
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    });
  }
}
