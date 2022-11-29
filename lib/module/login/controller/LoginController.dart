import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../search/view/screen/search.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  login(context, email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (jsonDecode(prefs.getString("userEmail")!) != null &&
        jsonDecode(prefs.getString("userPassword")!) != null) {
      var emailSP = jsonDecode(prefs.getString("userEmail")!);
      var passwordSP = jsonDecode(prefs.getString("userPassword")!);
      if (email == emailSP && password == passwordSP) {
        prefs.setBool('loggedIn', true);
        isLoading.value = true;
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Search()),
              (Route<dynamic> route) => false);
        });
      } else {
        return Get.snackbar('Error', 'Username or password invalid');
      }
    } else {
      return Get.snackbar('Error', 'This user does not exist');
    }
  }
}
