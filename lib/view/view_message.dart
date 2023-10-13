import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMessage extends StatelessWidget {
  final String name;
  final String photoURL;
  const ViewMessage({Key? key, required this.name, required this.photoURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4DFDA),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(photoURL),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 0, 88, 3),
                  ),
                )
              ],
            ),
          ],
        ),
        centerTitle: false,
        leading: IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          Tooltip(
            message: "Search",
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
          Tooltip(
            message: "More",
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text("View Message"),
      ),
    );
  }
}
