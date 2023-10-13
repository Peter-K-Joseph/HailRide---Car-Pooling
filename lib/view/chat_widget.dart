import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hailride/view/invite_group.dart';
import 'package:hailride/view/view_message.dart';
import 'package:hailride/view_model/bindings.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final DateTime time;
  final int status;
  final String avatarUrl;
  final int hasUnreadMessages;
  final int type;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.status,
    required this.avatarUrl,
    this.hasUnreadMessages = 0,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Widget statusWidget;
    switch (status) {
      case 0:
        statusWidget = Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Color(0xff005cee),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 10,
          ),
        );
        break;
      case 1:
        statusWidget = Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 238, 0, 0),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.crisis_alert_rounded,
            color: Colors.white,
            size: 10,
          ),
        );
        break;
      default:
        statusWidget = Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.question_mark_outlined,
            color: Colors.white,
            size: 10,
          ),
        );
    }
    return Container(
      alignment: Alignment.center,
      child: ListTile(
        onTap: () {
          Get.to(
            () => ViewMessage(
              name: name,
              photoURL: avatarUrl,
            ),
            transition: Transition.cupertino,
          );
        },
        contentPadding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (builder) => ChatWidget(group: name, type: type),
          );
        },
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(avatarUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            statusWidget,
          ],
        ),
        subtitle: Text(
          message,
          style: TextStyle(
            fontWeight:
                (hasUnreadMessages > 0) ? FontWeight.bold : FontWeight.normal,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: hasUnreadMessages == 0
            ? Text(
                "${time.hour}:${time.minute} ${time.hour > 12 ? "PM" : "AM"}",
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${time.hour}:${time.minute} ${time.hour > 12 ? "PM" : "AM"}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      "2",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.group, required this.type});
  final String group;
  final int type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete"),
            ),
            const ListTile(
              leading: Icon(Icons.archive),
              title: Text("Archive"),
            ),
            if (type == 2)
              ListTile(
                onTap: () => Get.to(
                  () => InviteToGroup(
                    group: group,
                  ),
                  binding: InviteToGroupBindings(),
                ),
                leading: const Icon(Icons.person_add),
                title: const Text("Add People"),
              ),
            const ListTile(
              leading: Icon(Icons.mark_email_read),
              title: Text("Mark as read"),
            ),
            const ListTile(
              leading: Icon(Icons.mark_email_unread),
              title: Text("Mark as unread"),
            ),
            const ListTile(
              leading: Icon(Icons.block),
              title: Text("Block"),
            ),
            const ListTile(
              leading: Icon(Icons.report),
              title: Text("Report"),
            ),
          ],
        ),
      ),
    );
  }
}
