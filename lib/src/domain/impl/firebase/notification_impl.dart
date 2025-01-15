// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tally_portal/src/data/repository/firebase/notification_interface.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/notifications/notification_actions.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/notifications/send_notification.dart';
// import 'package:tally_portal/src/domain/domain.dart';
//
// class NotificationImpl implements NotificationInterface {
//   SendNotification sendNotification = SendNotification();
//   NotificationActions notificationActions = NotificationActions();
//
//   @override
//   createNotification(
//       {required String notificationTitle,
//       required String notificationBody}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await notificationActions.createNotification(
//           notificationTitle: notificationTitle,
//           notificationBody: notificationBody);
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   deleteNotification({required String notificationId}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await notificationActions.deleteNotification(
//           notificationId: notificationId);
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   getNotifications({required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var data = await notificationActions.getNotifications(username: username)
//           as List<QueryDocumentSnapshot>;
//       responseModel.data = data;
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   sendBroadcastNotification(
//       {required String title, required String body}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await sendNotification.sendBroadcastNotification(title, body);
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   sendNotificationToAdmin({required String title, required String body}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await sendNotification.sendNotificationToAdmin(title: title, body: body);
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   sendToSpecificUser({required String title, required String body}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await sendNotification.sendToSpecificUser(title, body);
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   sendToSpecificUserName(
//       {required String title,
//       required String body,
//       required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await sendNotification.sendToSpecificUserName(
//           title: title, body: body, username: username);
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   updateNotification({required String notificationId}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await notificationActions.updateNotification(
//           notificationId: notificationId);
//       responseModel.data = "";
//     } catch (e) {
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
// }
