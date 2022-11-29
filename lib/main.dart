import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/splash/view/screen/splash_screen.dart';
import 'package:geekinn_test/utils/theme/color_const.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'module/login/view/screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Roboto',
            textTheme: const TextTheme().copyWith(
              bodyText2: TextStyle(
                color: MyColors.whiteColor,
              ),
            ),
            iconTheme: IconThemeData(color: MyColors.whiteColor),
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
