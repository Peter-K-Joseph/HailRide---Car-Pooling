import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/view_model/calendar.dart';
import 'package:hailride/view_model/dashboard.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key, required DashboardController parentController});
  final CalendarController _controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => TableCalendar(
                  locale: 'en_US',
                  pageAnimationCurve: Curves.fastEaseInToSlowEaseOut,
                  calendarFormat: _controller.calendarModel.format.value,
                  firstDay: _controller.getFirstDate(),
                  calendarStyle: const CalendarStyle(
                    holidayTextStyle: TextStyle(color: Colors.red),
                    holidayDecoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide.none),
                    ),
                  ),
                  lastDay: _controller.getLastDate(),
                  holidayPredicate: (day) => _controller.isDateHoliday(day),
                  onFormatChanged: (format) => _controller.changeFormat(format),
                  focusedDay: _controller.calendarModel.date.value,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, _controller.calendarModel.date.value),
                  onDaySelected: (selectedDay, focusedDay) =>
                      _controller.changeDate(selectedDay),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                controller: _controller.scrollController,
                children: _controller.getEvents(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
