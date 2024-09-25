import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_trading_app/controller/notification_controller.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.put(NotificationController());
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
      child: Column(
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
                id: notification.id,
                title: notification.title ?? '',
                message: notification.message ?? '',
                time: notification.time,
                imageUrl: notification.imageUrl ?? '',
              )).toList(),
            );
          }),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String? id;
  final String? title;
  final String? message;
  final DateTime? time;
  final String? imageUrl;

  const NotificationCard({
    Key? key,
    this.id,
    this.title,
    this.message,
    required this.time,
    this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
        // leading: const Icon(Icons.warning_amber_rounded, color: Colors.amber),
        leading: imageUrl!.isNotEmpty 
          ? ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.network(
              imageUrl!,
              height: screenWidth * 0.14,
              width: screenWidth * 0.14,
              // fit: BoxFit.cover,
            ),
          )
          :  Container(
            width: screenWidth * 0.14,
            height: screenWidth * 0.14,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        title: Text(
          title ?? '',
          style: TextStyle(
            fontSize: 14.0.sp,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
            color: const Color(0xFF008037),
            // overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message ?? '',
              style: TextStyle(
                fontSize: 11.1.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              // '${DateFormat('dd/MM/yy').format(time!)} | ${DateFormat('hh:mm a').format(time!)}',
              '${DateFormat('hh:mm a').format(time!)} | ${DateFormat('dd/MM/yy').format(time!)}',
              style: TextStyle(
                fontSize: 11.1.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 142, 142, 150),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}