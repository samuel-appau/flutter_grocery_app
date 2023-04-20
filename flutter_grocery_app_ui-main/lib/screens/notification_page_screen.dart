import 'package:flutter/material.dart';
import 'package:bulletin/bulletin.dart';

class NotificationPageScreen extends StatefulWidget {
  @override
  _NotificationPageScreenState createState() => _NotificationPageScreenState();
}

class _NotificationPageScreenState extends State<NotificationPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Notification",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      const SizedBox(height: 25),
      NotificationTile(),
    ]));
  }
}

Center NotificationTile() {
  return Center(
    child: Bulletin(
      icon: const Icon(
        Icons.notifications_on,
        size: 20,
      ),
      gapDuration: const Duration(seconds: 4),
      children: [
        BulletinItem(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
          textStyle: TextStyle(fontSize: 16),
          onTap: () {
            debugPrint("OnTap Function called for BulletinItem 1 ");
          },
        ),
        BulletinItem(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
          onTap: () {
            debugPrint("OnTap Function called for BulletinItem 2 ");
          },
        ),
        BulletinItem(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
          onTap: () {
            debugPrint("OnTap Function called for BulletinItem 3 ");
          },
        ),
      ],
    ),
  );
}
