// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/firebase_auth/firebase_app_auth.dart';
// import 'package:uuid/uuid.dart';
//
// class NotificationActions {
//   FirebaseAppAuth firebaseAppAuth = FirebaseAppAuth();
//   var firebaseFirestore = FirebaseFirestore.instance;
//
//   createNotification(
//       {required String notificationTitle,
//       required String notificationBody}) async {
//     String notificationId = const Uuid().v4();
//
//     firebaseAppAuth.getCurrentUser().then((value) {
//       print("this is the notification value === $value");
//       firebaseFirestore.collection('notifications').doc(notificationId).set({
//         "username": value,
//         "isRead": false,
//         "isArchived": false,
//         "notificationTitle": notificationTitle,
//         "notificationBody": notificationBody,
//         "dateAdded": DateTime.now(),
//         'updatedAt': DateTime.now(),
//       });
//     });
//   }
//
//   createNotificationOtherUser(
//       {required String username,
//       required String notificationTitle,
//       required String notificationBody}) async {
//     String notificationId = const Uuid().v4();
//
//     firebaseFirestore.collection('notifications').doc(notificationId).set({
//       "username": username,
//       "isRead": false,
//       "isArchived": false,
//       "notificationTitle": notificationTitle,
//       "notificationBody": notificationBody,
//       "dateAdded": DateTime.now(),
//       'updatedAt': DateTime.now(),
//     });
//   }
//
//   getNotifications({required String username}) async {
//     var data = await FirebaseFirestore.instance
//         .collection('notifications')
//         .where("username", isEqualTo: username)
//         // .orderBy('dateAdded', descending: true)
//         .get();
//
//     print("this is the notification raw data == ${data.docs}");
//
//     return data.docs;
//   }
//
//   updateNotification({required String notificationId}) async {
//     await firebaseFirestore
//         .collection("notifications")
//         .doc(notificationId)
//         .update({"isRead": true, "updatedAt": DateTime.now()});
//   }
//
//   deleteNotification({required String notificationId}) async {
//     await firebaseFirestore
//         .collection("notifications")
//         .doc(notificationId)
//         .update(
//             {"isRead": true, "isArchived": true, "updatedAt": DateTime.now()});
//
//     // await getNotifications();
//   }
// }
