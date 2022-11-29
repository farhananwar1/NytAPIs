import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geekinn_test/module/articles/view/widget/common_text_title.dart';
import 'package:geekinn_test/utils/getx_dependencies.dart';
import 'package:geekinn_test/utils/widget/common_action_button.dart';
import 'package:geekinn_test/utils/widget/common_text_form_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/theme/color_const.dart';

class BottomSheetForBook extends StatefulWidget {
  final int page;

  const BottomSheetForBook({Key? key, required this.page}) : super(key: key);

  @override
  State<BottomSheetForBook> createState() => _BottomSheetForBookState();
}

class _BottomSheetForBookState extends State<BottomSheetForBook> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kBookController.date.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * .7,
          decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Text(
                "Select Date",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MyColors.blackColor),
              ),
              SizedBox(height: 50.h),
              TableCalendar(
                firstDay: DateTime.utc(1900, 12, 31),
                lastDay: DateTime.utc(2050, 12, 31),
                focusedDay: selectedDate,
                calendarFormat: calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onFormatChanged: (CalendarFormat format) {
                  setState(() {
                    calendarFormat = format;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDate, date);
                },
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDate = selectDay;
                    selectedDate = focusDay;
                    var date =
                        DateFormat("yyyy-MM-dd").parse(selectedDate.toString());
                    kBookController.page.value = 1;
                    kBookController.date.value = date.toIso8601String();
                    Navigator.of(context).pop();
                    kBookController.getBooksResponse.value = [];
                    kBookController.getBooksOnTheBasesOfFilter(
                        context,
                        'Best Sellers Lists Services',
                        kBookController.page.value,
                        kBookController.date.value);
                  });
                },
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                        color: MyColors.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    defaultTextStyle: const TextStyle(color: Colors.black),
                    selectedDecoration: BoxDecoration(
                        color: MyColors.blackColor, shape: BoxShape.circle),
                    selectedTextStyle: TextStyle(color: MyColors.whiteColor),
                    todayDecoration: BoxDecoration(
                        color: MyColors.blackColor, shape: BoxShape.circle)),
                daysOfWeekHeight: 25,
              )
            ],
          )),
    );
  }
}
