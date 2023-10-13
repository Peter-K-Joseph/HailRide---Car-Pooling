import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/model/calendar_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  CalendarModel calendarModel = CalendarModel();
  final scrollController = ScrollController();

  DateTime changeDate(DateTime date) {
    calendarModel.date.value = date;
    return date;
  }

  DateTime getFirstDate() {
    DateTime date = DateTime.now();
    date = date.subtract(const Duration(days: 360));
    return date;
  }

  void changeFormat(CalendarFormat format) {
    calendarModel.format.value = format;
  }

  DateTime getLastDate() {
    DateTime date = DateTime.now();
    date = date.add(const Duration(days: 360));
    return date;
  }

  bool isDateHoliday(DateTime date) {
    if (date.weekday == 7) {
      return true;
    }
    return false;
  }

  List<Widget> getEvents() {
    List<Widget> events = [];
    for (int i = 0; i < 10; i++) {
      events.add(
        Container(
          margin: const EdgeInsets.all(5),
          child: ListTile(
            title: const Text('Christmas'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            subtitle: Text('Event $i'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      );
    }
    return events;
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.pixels <= 3) {
        changeFormat(CalendarFormat.month);
      } else {
        if (calendarModel.format.value == CalendarFormat.month) {
          changeFormat(CalendarFormat.week);
        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
