import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme/color_const.dart';

class CommonTextTitle extends StatelessWidget {
  const CommonTextTitle(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.color,
      this.fontWeight,
      this.fontSize})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color color;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontSize ?? 14.sp,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
