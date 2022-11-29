import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/search/view/widget/bottom_nav_bar.dart';
import 'package:geekinn_test/utils/getx_dependencies.dart';
import 'package:geekinn_test/utils/stringConst/asset_icon_links.dart';
import 'package:geekinn_test/utils/theme/color_const.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../utils/enums.dart';
import '../../../articles/view/screen/article_screen.dart';
import '../../../articles/view/screen/bottom_sheet_for_article.dart';
import '../../../books/view/screen/books_screen.dart';
import '../../../books/view/screen/bottom_sheet_for_book.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    final index = DefaultTabController.of(context)!.index;
                    index == 0
                        ? showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22.r)),
                            ),
                            context: context,
                            builder: (context) {
                              return const BottomSheetForArticle(page: 1);
                            },
                          )
                        : showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22.r)),
                            ),
                            context: context,
                            builder: (context) {
                              return const BottomSheetForBook(page: 1);
                            },
                          );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    AssetIconLinks.appLogo,
                    width: 24.w,
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              labelColor: MyColors.blackColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: "Articles"),
                Tab(text: "Books"),
              ],
            ),
            title: const Text("Search"),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [Articles(), Books()],
          ),
        );
      }),
    );
  }
}
