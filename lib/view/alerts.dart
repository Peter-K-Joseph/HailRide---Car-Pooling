import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertingServices {
  var icons = {
    "success": Icons.check_circle,
    "error": Icons.error,
    "warning": Icons.warning,
    "info": Icons.info,
  };

  var colors = {
    "success": Colors.green,
    "error": Colors.red,
    "warning": const Color.fromARGB(255, 255, 170, 0),
    "info": Colors.blue,
  };

  alertingMesseger(
    String type,
    String title,
    String content,
    icon, {
    int timer = 3000,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: timer),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        width: 550,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: colors[type],
        content: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Row(
            children: [
              Icon(
                ((icon == null) ? icons[type] : icon),
                color: Colors.white,
                size: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(content),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlertNotifier extends StatelessWidget {
  final String text;
  final String type;
  const AlertNotifier({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    var colors = {
      "success": const Color.fromARGB(255, 75, 204, 81),
      "error": const Color.fromARGB(255, 255, 78, 78),
      "warn": const Color.fromARGB(255, 255, 200, 0),
      "info": Colors.blue[300],
    };

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colors[type],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
