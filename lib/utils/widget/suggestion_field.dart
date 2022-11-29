import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/utils/theme/color_const.dart';

class SignUpSuggestionButton extends StatelessWidget {
  const SignUpSuggestionButton(
      {Key? key,
      required this.fistText,
      required this.secondText,
      required this.onTap})
      : super(key: key);
  final String fistText;
  final String secondText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        InkWell(
          onTap: onTap,
          child: Text.rich(
            TextSpan(
              text: '',
              children: <InlineSpan>[
                TextSpan(
                  text: fistText,
                  style: TextStyle(
                      color: MyColors.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: secondText,
                  style: TextStyle(
                      color: MyColors.backgroundGre1,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [

          //     Expanded(
          //       flex: 7,
          //       child: Text(
          //         fistText,
          //         style:
          //             TextStyle(color: MyColors.whiteColor, fontSize: 20.sp),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 3,
          //       child: Text(
          //         secondText,
          //         style:
          //             TextStyle(color: MyColors.yellowColor, fontSize: 20.sp),
          //       ),
          //     ),
          //   ],
          // ),
        ),
        SizedBox(height: 56.h),
      ],
    );
  }
}
