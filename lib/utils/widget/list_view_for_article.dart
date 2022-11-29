import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/articles/view/widget/common_text_title.dart';
import 'package:geekinn_test/utils/theme/color_const.dart';

class ListViewCard extends StatefulWidget {
  final String source;
  final String snippet;

  const ListViewCard({Key? key, required this.source, required this.snippet})
      : super(key: key);

  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
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
        Center(
            child: Text(
          "---------------",
          style: TextStyle(color: MyColors.blackColor),
        ))
      ],
    );
  }
}
