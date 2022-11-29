import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/articles/view/screen/bottom_sheet_for_article.dart';
import 'package:geekinn_test/utils/getx_dependencies.dart';
import 'package:geekinn_test/utils/theme/color_const.dart';
import 'package:geekinn_test/utils/widget/list_view_for_article.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      kArticleController.getArticlesResponse.value = [];
      page = 1;
      openBottomSheet();
    });
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
          print(page);
          if (page > 0) {
            kArticleController.getArticlesOnTheBasesOfFilter(
                context, kArticleController.filteredOption.value, ++page);
          }
        }
      }
    });
  }

  openBottomSheet() {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
      ),
      context: context,
      builder: (context) {
        return BottomSheetForArticle(page: page);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return kArticleController.getArticlesResponse.isEmpty
          ? Center(
              child: Text(
              "Nothing Found",
              style: TextStyle(
                  color: MyColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ))
          : kArticleController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: controller,
                  itemCount: kArticleController.getArticlesResponse.length,
                  itemBuilder: (context, index) {
                    final source =
                        kArticleController.getArticlesResponse[index]['source'];
                    final snippet = kArticleController
                        .getArticlesResponse[index]['snippet'];
                    return ListViewCard(source: source, snippet: snippet);
                  });
    });
  }
}
