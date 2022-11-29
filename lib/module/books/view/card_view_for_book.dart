import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theme/color_const.dart';
import '../../articles/view/widget/common_text_title.dart';

class ListViewCardForBook extends StatefulWidget {
  final String source;
  final String snippet;
  final String date;

  const ListViewCardForBook(
      {Key? key,
      required this.source,
      required this.snippet,
      required this.date})
      : super(key: key);

  @override
  State<ListViewCardForBook> createState() => _ListViewCardForBookState();
}

class _ListViewCardForBookState extends State<ListViewCardForBook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextTitle(
          text: widget.source,
          onTap: () {},
          color: MyColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        CommonTextTitle(
            text: widget.snippet, onTap: () {}, color: MyColors.blackColor),
        SizedBox(height: 10.h),
        CommonTextTitle(
            text: widget.date, onTap: () {}, color: MyColors.blackColor),
        Center(
            child: Text(
          "---------------",
          style: TextStyle(color: MyColors.blackColor),
        ))
      ],
    );
  }
}
