import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/utils/enums.dart';
import 'package:geekinn_test/utils/getx_dependencies.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../utils/theme/color_const.dart';

class TopNavBar extends StatelessWidget {
  TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("isHomePage ${kSearchController.selectedModule.value}");
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => TopNavBarButton(
                      isSelected: kSearchController.selectedModule.value ==
                          SearchModules.articles,
                      onTap: () {
                        kSearchController.selectedModule.value =
                            SearchModules.articles;
                      },
                      title: 'Articles',
                    ),
                  ),
                  Obx(
                    () => TopNavBarButton(
                      isSelected: kSearchController.selectedModule.value ==
                          SearchModules.books,
                      onTap: () {
                        kSearchController.selectedModule.value =
                            SearchModules.books;
                      },
                      title: 'Books',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopNavBarButton extends StatelessWidget {
  const TopNavBarButton(
      {Key? key,
      required this.isSelected,
      required this.onTap,
      required this.title})
      : super(key: key);
  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 90.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                color:
                    isSelected ? MyColors.blackColor : MyColors.backgroundGre1,
              ),
            ),
            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }
}
