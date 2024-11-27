import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
late DeviceInfoPlugin deviceInfoPlugin;
late AndroidDeviceInfo androidDeviceInfo;
late bool? isNotificationInitialized;


Future<void> initializeNotification() async {
  debugPrint("started-----------");
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  deviceInfoPlugin = DeviceInfoPlugin();

  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const initializationSettingsIOS = DarwinInitializationSettings();

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  isNotificationInitialized = await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      // Handle notification click
      debugPrint("Notification clicked with payload: ${response.payload}");
    },
  );

  await requestNotificationPermission();

  print("FlutterLocalNotificationsPlugin initialized.");

}

Future<void> requestNotificationPermission() async {
  if (Platform.isIOS) {
    print("Requesting iOS notification permissions...");
    final bool? status = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    debugPrint("iOS notification permission status: $status");
  } else if (Platform.isAndroid) {
    if (androidDeviceInfo.version.sdkInt >= 33) {
      print("Requesting Android 13+ notification permissions...");
      final status = await Permission.notification.request();
      debugPrint("Android notification permission status: $status");
    } else {
      print("Notification permissions are not required for Android < 13.");
    }
  }
}

Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'default_channel_id', // Channel ID
    'Default Channel', // Channel name
    channelDescription: 'This is the default channel for notifications',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'Test Notification', // Title
    'This is a test notification', // Body
    platformChannelSpecifics,
    payload: 'Notification Payload', // Payload data
  );
}

