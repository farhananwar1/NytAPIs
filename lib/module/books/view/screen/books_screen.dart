import 'package:flutter/material.dart';
import 'package:geekinn_test/module/books/view/card_view_for_book.dart';
import 'package:geekinn_test/utils/getx_dependencies.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../../../../utils/theme/color_const.dart';
import '../../../../utils/widget/list_view_for_article.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final controller = ScrollController();
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUTCDate();
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
          kBookController.getBooksOnTheBasesOfFilter(
              context,
              'Best Sellers Lists Services',
              ++kBookController.page.value,
              kBookController.date.value);
        }
      }
    });
  }

  getUTCDate() {
    kBookController.date.value = dateTime.toIso8601String();
    getBookResponse(kBookController.date.value);
  }

  getBookResponse(date) {
    kBookController.getBooksResponse.value = [];
    kBookController.page.value = 1;
    kBookController.getBooksOnTheBasesOfFilter(context,
        'Best Sellers Lists Services', kBookController.page.value, date);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return kBookController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : kBookController.getBooksResponse.isEmpty
              ? Center(
                  child: Text(
                  "Nothing Found",
                  style: TextStyle(
                      color: MyColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ))
              : ListView.builder(
                  controller: controller,
                  itemCount: kBookController.getBooksResponse.length,
                  itemBuilder: (context, index) {
                    final source =
                        kBookController.getBooksResponse[index]['source'];
                    final snippet =
                        kBookController.getBooksResponse[index]['snippet'];
                    final date =
                        kBookController.getBooksResponse[index]['pub_date'];
                    final normalDate = DateFormat("yyyy-MM-dd").parse(date);
                    return ListViewCardForBook(
                        source: source,
                        snippet: snippet,
                        date: normalDate.toString().substring(0, 10));
                  });
    });
  }
}
