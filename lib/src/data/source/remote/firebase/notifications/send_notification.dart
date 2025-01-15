// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
// import 'package:tally_portal/src/data/source/remote/config_firebase/app_firebase_config.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/firebase_auth/firebase_app_auth.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/notifications/notification_actions.dart';
//
// class SendNotification {
//   final firebaseFirestore = FirebaseFirestore.instance;
//
//   AppFirebaseConfig appFirebaseConfig = AppFirebaseConfig();
//
//   FirebaseAppAuth firebaseAppAuth = FirebaseAppAuth();
//
//   NotificationActions notificationActions = NotificationActions();
//
//   Future<void> sendNotificationToAdmin(
//       {required String title, required String body}) async {
//     List<String> tokens = [];
//
//     await firebaseFirestore
//         .collection('users')
//         .where('role', isNotEqualTo: 'user')
//         .get()
//         .then((value) {
//       for (var token in value.docs) {
//         tokens.add(token.data()['notification_token']);
//       }
//     });
//
//     for (var toks in tokens) {
//       var res = await http.post(Uri.parse(appFirebaseConfig.fcmUrl),
//           headers: <String, String>{
//             'Content-Type': appFirebaseConfig.fcmContentType,
//             'Authorization': appFirebaseConfig.fcmKey
//           },
//           body: jsonEncode(<String, dynamic>{
//             "to": toks,
//             "priority": "high",
//             "notification": {
//               "body": body,
//               "title": title,
//               "sound": appFirebaseConfig.fcmSound
//               // "click_action": "FLUTTER_NOTIFICATION_CLICK",
//               // "screen": "/user-profile-screen",
//             }
//           }));
//
//       print('THIS IS  THE RESPONSE FRMSEND NOTIFICATION ${res.body}');
//     }
//   }
//
//   Future<void> sendBroadcastNotification(String title, String body) async {
//     List<String> tokens = [];
//
//     await firebaseFirestore
//         .collection('users')
//         .where('role', isEqualTo: 'user')
//         .get()
//         .then((value) {
//       for (var token in value.docs) {
//         tokens.add(token.data()['notification_token']);
//       }
//     });
//
//     for (var toks in tokens) {
//       var res = await http.post(Uri.parse(appFirebaseConfig.fcmUrl),
//           headers: <String, String>{
//             'Content-Type': appFirebaseConfig.fcmContentType,
//             'Authorization': appFirebaseConfig.fcmKey
//           },
//           body: jsonEncode(<String, dynamic>{
//             "to": toks,
//             "notification": {
//               "body": body,
//               "title": title,
//               "sound": appFirebaseConfig.fcmSound
//               // "click_action": "FLUTTER_NOTIFICATION_CLICK",
//               // "screen": "/user-profile-screen",
//             }
//           }));
//
//       print('THIS IS  THE RESPONSE FRMSEND NOTIFICATION ${res.body}');
//     }
//   }
//
//   Future<void> sendToSpecificUser(String title, String body) async {
//     firebaseAppAuth.getCurrentUser().then((value) async {
//       print("this is the notification value === $value");
//
//       var res = await http.post(Uri.parse(appFirebaseConfig.fcmUrl),
//           headers: <String, String>{
//             'Content-Type': appFirebaseConfig.fcmContentType,
//             'Authorization': appFirebaseConfig.fcmKey
//           },
//           body: jsonEncode(<String, dynamic>{
//             "to": value,
//             "notification": {
//               "body": body,
//               "title": title,
//               "sound": appFirebaseConfig.fcmSound
//               // "click_action": "FLUTTER_NOTIFICATION_CLICK",
//               // "screen": "/user-profile-screen",
//             }
//           }));
//
//       print('THIS IS  THE RESPONSE FRMSEND NOTIFICATION ${res.body}');
//     });
//
//     notificationActions.createNotification(
//         notificationTitle: title, notificationBody: body);
//   }
//
//   Future<void> sendToSpecificUserName(
//       {required String title,
//       required String body,
//       required String username}) async {
//     FirebaseFirestore.instance
//         .collection('users')
//         .where("username", isEqualTo: username)
//         .get()
//         .then((value) async {
//       var res = await http.post(Uri.parse(appFirebaseConfig.fcmUrl),
//           headers: <String, String>{
//             'Content-Type': appFirebaseConfig.fcmContentType,
//             'Authorization': appFirebaseConfig.fcmKey
//           },
//           body: jsonEncode(<String, dynamic>{
//             "to": value.docs[0]["notification_token"],
//             "notification": {
//               "body": body,
//               "title": title,
//               "sound": appFirebaseConfig.fcmSound
//               // "click_action": "FLUTTER_NOTIFICATION_CLICK",
//               // "screen": "/user-profile-screen",
//             }
//           }));
//
//       log('THIS IS  THE RESPONSE FRM SEND NOTIFICATION ${res.body}');
//     });
//
//     notificationActions.createNotificationOtherUser(
//         username: username, notificationTitle: title, notificationBody: body);
//   }
// }
