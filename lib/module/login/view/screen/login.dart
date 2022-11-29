import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/signup/view/screen/sign_up.dart';
import 'package:geekinn_test/utils/widget/common_action_button.dart';
import 'package:geekinn_test/utils/widget/common_text_form_field.dart';
import 'package:geekinn_test/utils/widget/suggestion_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/getx_dependencies.dart';
import '../../../../utils/theme/color_const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kLoginController.isLoading.value = false;
  }

  validateFields(String? email, String? password) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty || !regex.hasMatch(email)) {
      return Get.snackbar('Error', 'Please enter the valid email address');
    } else if (password == null || password.isEmpty) {
      return Get.snackbar('Error', 'Please enter the valid password');
    }
    return kLoginController.login(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Text(
                      "Geekinn",
                      style: TextStyle(
                          color: MyColors.blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    CommonTextField(
                        textAlign: TextAlign.start,
                        border: Border.all(color: MyColors.blackColor),
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        hintText: 'Email',
                        textInputAction: TextInputAction.next,
                        onChanged: (v) {
                          email = v;
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    CommonTextField(
                        textAlign: TextAlign.start,
                        border: Border.all(color: MyColors.blackColor),
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        hintText: 'Password',
                        textInputAction: TextInputAction.next,
                        onChanged: (v) {
                          password = v;
                        }),
                    SizedBox(
                      height: 100.h,
                    ),
                    Obx(() {
                      return kLoginController.isLoading.value
                          ? const CircularProgressIndicator()
                          : CommonActionButton(
                              text: 'Login',
                              onTap: () => validateFields(
                                  email.toLowerCase().trim(), password));
                    }),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SignUpSuggestionButton(
                            fistText: "Don't Have an Account? ",
                            secondText: 'Sign Up',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
