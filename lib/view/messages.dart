import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/model/constants.dart';
import 'package:hailride/view_model/dashboard.dart';
import 'package:hailride/view_model/messages.dart';

class Messages extends StatelessWidget {
  Messages({super.key, required DashboardController parentController});
  final MessageController _controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 5, 8.0, 0),
                        child: Obx(
                          () => TextFormField(
                            textInputAction: TextInputAction.search,
                            onChanged: (value) {
                              _controller.updateOnFilter(searchQuery: value);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10,
                              ),
                              hintText: _controller.searchPlaceholder.value,
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: MessageFilters.values
                              .map((MessageFilters exercise) {
                            return Obx(
                              () => Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                child: FilterChip(
                                  shape: const StadiumBorder(
                                    side: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  label: Text(exercise.name),
                                  selected:
                                      _controller.filters.contains(exercise),
                                  onSelected: (bool selected) {
                                    _controller.addFilter(exercise);
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Obx(
                    () => _controller.messages.isEmpty
                        ? const Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 200,
                                ),
                                Icon(
                                  Icons.message_outlined,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "No Messages",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: _controller.messages,
                          ),
                  ),
                  const SizedBox(
                    height: 130,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
