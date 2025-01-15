// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HelperNotification {

  static const androidChannel = AndroidNotificationChannel(
      "high_importance_channel",
      "High Importance Notifications",
      description: "Used for important notifications",
      importance: Importance.high);

  // static Future<void> initialize(
  //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  //   var androidInitialize =
  //   const AndroidInitializationSettings('img');
  //   var iosInitialize = const DarwinInitializationSettings();
  //   var initializationSettings =
  //   InitializationSettings(android: androidInitialize, iOS: iosInitialize);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //   );
  //
  //   final platform =
  //   flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin>();
  //
  //   await platform?.createNotificationChannel(androidChannel);
  //
  //   //for apple
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //       alert: true, badge: true, sound: true);
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print("============onMessage=============");
  //     print(
  //         "onmessage ===== ${message.notification?.title} ${message.notification?.body}");
  //
  //     HelperNotification.showNotification(message, flutterLocalNotificationsPlugin);
  //   });
  //
  //   FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  // }
  //
  // static showNotification(RemoteMessage message, FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
  //   print("coming now nw now ${message.notification?.title}");
  //   flutterLocalNotificationsPlugin.show(
  //       message.notification.hashCode,
  //       message.notification?.title,
  //       message.notification?.body,
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(androidChannel.id,
  //               androidChannel.name, channelDescription: androidChannel.description,
  //               importance: Importance.high)));
  // }
}
