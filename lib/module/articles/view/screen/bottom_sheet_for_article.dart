import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/articles/view/widget/common_text_title.dart';
import 'package:geekinn_test/utils/getx_dependencies.dart';
import 'package:geekinn_test/utils/widget/common_action_button.dart';
import 'package:geekinn_test/utils/widget/common_text_form_field.dart';
import 'package:get/get.dart';

import '../../../../utils/theme/color_const.dart';

class BottomSheetForArticle extends StatefulWidget {
  final int page;
  const BottomSheetForArticle({Key? key, required this.page}) : super(key: key);

  @override
  State<BottomSheetForArticle> createState() => _BottomSheetForArticleState();
}

class _BottomSheetForArticleState extends State<BottomSheetForArticle> {
  validateFields(value) {
    if (value == "") {
      Get.snackbar('Error', 'Please click on any of the filter',
          snackPosition: SnackPosition.TOP,
          backgroundColor: MyColors.blackColor);
    } else {
      kArticleController.getArticlesOnTheBasesOfFilter(
          context, value, widget.page);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kArticleController.isLoading.value = false;
    kArticleController.filteredOption.value = '';
    kArticleController.body.value = false;
    kArticleController.specPg.value = false;
    kArticleController.cWork.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * .6,
          decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Text(
                "Filters",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MyColors.blackColor),
              ),
              SizedBox(height: 50.h),
              Obx(() {
                return CommonTextTitle(
                  text: 'Body',
                  onTap: () {
                    kArticleController.body.value = true;
                    kArticleController.specPg.value = false;
                    kArticleController.cWork.value = false;
                    kArticleController.filteredOption.value = 'body';
                  },
                  color: kArticleController.body.value
                      ? MyColors.darkCyanColor
                      : MyColors.blackColor,
                );
              }),
              SizedBox(height: 20.h),
              Obx(() {
                return CommonTextTitle(
                  text: 'SecPg',
                  onTap: () {
                    kArticleController.body.value = false;
                    kArticleController.specPg.value = true;
                    kArticleController.cWork.value = false;
                    kArticleController.filteredOption.value = 'secpg';
                  },
                  color: kArticleController.specPg.value
                      ? MyColors.darkCyanColor
                      : MyColors.blackColor,
                );
              }),
              SizedBox(height: 20.h),
              Obx(() {
                return CommonTextTitle(
                  text: 'Creative Works',
                  onTap: () {
                    kArticleController.body.value = false;
                    kArticleController.specPg.value = false;
                    kArticleController.cWork.value = true;
                    kArticleController.filteredOption.value = 'creative_works';
                  },
                  color: kArticleController.cWork.value
                      ? MyColors.darkCyanColor
                      : MyColors.blackColor,
                );
              }),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    return kArticleController.isLoading.value
                        ? const CircularProgressIndicator()
                        : CommonActionButton(
                            text: 'Filter',
                            onTap: () {
                              validateFields(
                                  kArticleController.filteredOption.value);
                            },
                          );
                  }),
                  SizedBox(height: 50.h)
                ],
              ))
            ],
          )),
    );
  }
}
