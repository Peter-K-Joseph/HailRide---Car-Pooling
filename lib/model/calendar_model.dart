import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarModel {
  Rx<DateTime> date = DateTime.now().obs;
  Rx<CalendarFormat> format = CalendarFormat.month.obs;
}
