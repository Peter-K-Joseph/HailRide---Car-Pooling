import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/model/bottom_navigation_model.dart';
import 'package:hailride/view/calendar.dart';
import 'package:hailride/view/home.dart';
import 'package:hailride/view/messages.dart';
import 'package:hailride/view_model/dashboard.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key}) {
    Get.put<DashboardController>(DashboardController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Get.find<DashboardController>().appBarColor.value,
          title: Text(
            Get.find<DashboardController>().title.value,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0,
          actions: [
            Stack(
              children: [
                SizedBox(
                  width: 40,
                  height: 50,
                  child: Icon(
                    Icons.notifications,
                    color: Get.find<DashboardController>().iconColor.value,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Obx(
                      () => Text(
                        Get.find<DashboardController>()
                            .activeNotifications
                            .value
                            .toString(), // Replace with your actual notification count
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Get.find<DashboardController>().iconColor.value,
              ),
            )
          ],
        ),
        extendBody: true,
        backgroundColor: const Color(0xFFf3f5f8),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          padding: const EdgeInsets.all(5),
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 50,
                offset: Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Obx(
            () => Wrap(
              children: [
                BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  currentIndex:
                      Get.find<DashboardController>().currentIndex.value,
                  selectedItemColor: const Color(0xff005cee),
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  items: BottomNavigationMode().items,
                  onTap: (index) {
                    Get.find<DashboardController>().currentIndex.value = index;
                    Get.find<DashboardController>().changeAppBarColor();
                  },
                )
              ],
            ),
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: Get.find<DashboardController>().currentIndex.value,
            children: [
              Home(
                parentController: Get.find<DashboardController>(),
              ),
              Calendar(
                parentController: Get.find<DashboardController>(),
              ),
              Messages(parentController: Get.find<DashboardController>()),
              Messages(parentController: Get.find<DashboardController>()),
              Messages(parentController: Get.find<DashboardController>()),
            ],
          ),
        ),
      ),
    );
  }
}
