import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/login/view/screen/login.dart';
import 'package:get/get.dart';

import '../../../../utils/getx_dependencies.dart';
import '../../../../utils/theme/color_const.dart';
import '../../../../utils/widget/common_action_button.dart';
import '../../../../utils/widget/common_text_form_field.dart';
import '../../../../utils/widget/suggestion_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = '';
  String email = '';
  String password = '';

  validateFields(String? name, String? email, String? password) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (name == null || name.isEmpty) {
      return Get.snackbar('Error', 'Please enter the valid name');
    } else if (email == null || email.isEmpty || !regex.hasMatch(email)) {
      return Get.snackbar('Error', 'Please enter the valid email address');
    } else if (password == null || password.isEmpty) {
      return Get.snackbar('Error', 'Please enter the valid password');
    }
    return kSignupController.singUp(context, name, email, password);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kSignupController.isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
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
                          hintText: 'Name',
                          textInputAction: TextInputAction.next,
                          onChanged: (v) {
                            name = v;
                          }),
                      SizedBox(
                        height: 10.h,
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
                        return kSignupController.isLoading.value
                            ? const CircularProgressIndicator()
                            : CommonActionButton(
                                text: 'Signup',
                                onTap: () => validateFields(name,
                                    email.toLowerCase().trim(), password));
                      }),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SignUpSuggestionButton(
                              fistText: "Already Have an Account? ",
                              secondText: 'Login',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
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
          ),
        ],
      ),
    );
  }
}
