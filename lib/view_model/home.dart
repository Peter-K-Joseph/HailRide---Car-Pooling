import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/view/alerts.dart';
import 'package:hailride/view_model/dashboard.dart';

class HomeController extends GetxController {
  RxString greetings = "Hello".obs;
  RxString name = "...".obs;

  void getCurrentLoggedInUser() async {
    // get it from firebase
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(user.uid).get();
      print("Recoebed ${snapshot.data()}");
      name.value = snapshot.data()!['name'];
    } else {
      AlertingServices().alertingMesseger(
        "error",
        "Error",
        "Couldn't fetch user data",
        Icons.error,
      );
    }
  }

  void generateGreetings() {
    var hour = DateTime.now().hour;
    var day = DateTime.now().weekday;
    if (hour < 12) {
      greetings.value = "Good Morning";
    } else if (hour < 17) {
      greetings.value = "Good Afternoon";
    } else {
      greetings.value = "Good Evening";
    }
    if (day == DateTime.sunday) {
      greetings.value = "Happy Sunday";
    }
  }

  @override
  void onInit() {
    super.onInit();
    generateGreetings();
    getCurrentLoggedInUser();
  }
}
