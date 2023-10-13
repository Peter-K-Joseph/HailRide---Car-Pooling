import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/model/constants.dart';
import 'package:hailride/view/chat_widget.dart';
import 'package:hailride/view_model/dashboard.dart';

class MessageController extends GetxController {
  RxSet<MessageFilters> filters = <MessageFilters>{}.obs;
  RxList<Widget> messages = <Widget>[].obs;
  RxString searchPlaceholder = "Search for Contacts".obs;
  Timer? _debounce;
  int currentPlaceholderIndex = 0;

  void addFilter(MessageFilters filter) {
    if (filters.contains(filter)) {
      filters.remove(filter);
    } else {
      filters.add(filter);
    }
  }

  void updatePlaceholder() {
    List<String> placeholders = [
      'Search for Contacts',
      'Search for Groups',
      'Search for Broadcasts',
    ];
    _debounce?.cancel(); // Cancel any existing timer

    _debounce = Timer.periodic(const Duration(seconds: 5), (timer) {
      searchPlaceholder.value = placeholders[currentPlaceholderIndex];
      currentPlaceholderIndex =
          (currentPlaceholderIndex + 1) % placeholders.length;
    });
  }

  void updateOnFilter({String? searchQuery}) {}

  @override
  void onInit() {
    super.onInit();
    messages.addAll([
      ChatTile(
        name: "7BTCS A",
        message:
            "Aaron Boban Thomas: Guys! Do we need to submit the assignment tomorrow?",
        time: DateTime.now(),
        status: 0,
        type: 2,
        hasUnreadMessages: 4,
        avatarUrl: "https://picsum.photos/400",
      ),
      ChatTile(
        avatarUrl:
            'https://lh3.googleusercontent.com/a-/AD_cMMSkDISFoBGPWddBFjhKEqCb9-A6fKpO6RV_TOUpdcsx1eQ=s256-p',
        name: "Gurudas V",
        status: 0,
        type: 0,
        time: DateTime.now(),
        message:
            'Students, I have shared an email regarding placements. Kindly go through the same and finish the task.',
      ),
      ChatTile(
        avatarUrl:
            'https://lh3.googleusercontent.com/a-/AD_cMMQAw-uPuwXaFcUKsADqb9nrfgFsjBEWYW6K7Cpify3p4Dk=s240-p-k-no',
        name: "Christy Jose",
        type: 0,
        status: 2,
        time: DateTime.now(),
        message: 'Peter, did you complete the AI assignment?',
      ),
      ChatTile(
        avatarUrl:
            'https://lh3.googleusercontent.com/a-/AD_cMMTSLPV3OEBjVoHl5Q9q_UZhxNJgMyC9ytdWxYiqePnxsA=s256-p',
        name: "Tom Emmanuel",
        status: 1,
        type: 0,
        time: DateTime.now(),
        message:
            'Google Forms Having trouble viewing or submitting this form? Fill out in Google Forms',
      ),
      ChatTile(
        name: '7BTCS B',
        message:
            'Guys, we have a meeting tomorrow at 10:00 AM. Please be on time.',
        time: DateTime.now(),
        type: 0,
        status: 0,
        avatarUrl:
            'https://lh3.googleusercontent.com/contacts/ADUEL1wSeuTgx8RxDQu-vIJt8ZeCe8Y0v3X2Y5QN-c8Gt92IDF5ivZsn=s240-p-k-no',
      ),
    ]);
    updatePlaceholder();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
