import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/controller/notification_controller.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.put(NotificationController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      children: [
        Obx(() {
          if (notificationController.notifications.isEmpty) {
            return Row(
              children: [
                Text(
                  'Investment Opportunities',
                  style: TextStyle(
                    fontSize: 17.25.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D192B),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          }
          return Column(
            children: notificationController.notifications.map((notification) =>
            NotificationCard(
              title: notification.title ?? '',
              message: notification.message ?? '',
              time: notification.time,
            )).toList(),
          );
          // return ListView.builder(
          //   itemCount: notificationController.notifications.length,
          //   itemBuilder: (context, index) {
          //     final notification = notificationController.notifications[index];
          //     return NotificationCard(
          //       title: notification.title ?? '',
          //       message: notification.message ?? '',
          //       time: notification.time,
          //     );
          //   },
          // );
        }),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       ElevatedButton(
        //         onPressed: notificationController.markAllAsRead,
        //         child: Text('Mark all as read'),
        //       ),
        //       OutlinedButton(
        //         onPressed: notificationController.clearAllNotifications,
        //         child: Text('Clear all'),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String? title;
  final String? message;
  final DateTime? time;

  const NotificationCard({
    Key? key,
    this.title,
    this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Icon(Icons.warning_amber_rounded, color: Colors.amber),
        title: Text(
          title ?? '',
          style: TextStyle(
            color: Colors.green, // Customizing the title color
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(message ?? ''),
        // trailing: Text(time as String),
      ),
    );
  }
}