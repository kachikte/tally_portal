// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:tally_portal/src/data/data.dart';
// import 'package:tally_portal/src/domain/domain.dart';
// import 'package:tally_portal/src/domain/impl/firebase/notification_impl.dart';
//
// class NotificationController extends GetxController {
//   NotificationImpl notificationImpl = NotificationImpl();
//
//   AppDBNotifications appDBNotifications = AppDBNotifications();
//
//   RxInt notificationCount = 0.obs;
//   RxInt newNotificationCount = 0.obs;
//   RxBool newNotification = false.obs;
//
//   List<AppNotificationModel> appNotifications = [];
//
//   setNotificationsLocal() async {
//     appNotifications = await appDBNotifications.getNotifications();
//   }
//
//   getNotification({required String username}) async {
//     ResponseModel responseModel =
//         await notificationImpl.getNotifications(username: username);
//
//     if (responseModel.isError) {
//       appNotifications = await appDBNotifications.getNotifications();
//     } else {
//       appNotifications.clear();
//       var dataList = responseModel.data as List<QueryDocumentSnapshot<dynamic>>;
//
//       for (var notification in dataList) {
//         bool fieldExistsRead = notification.data().containsKey("isRead");
//         bool fieldExistsArchived =
//             notification.data().containsKey("isArchived");
//
//         AppNotificationModel appNotificationModel = AppNotificationModel(
//             id: notification.id,
//             username: notification["username"],
//             notificationBody: notification["notificationBody"],
//             notificationTitle: notification["notificationTitle"],
//             isRead: fieldExistsRead ? notification["isRead"] : false,
//             isArchived:
//                 fieldExistsArchived ? notification["isArchived"] : false,
//             updatedAt: (notification["updatedAt"] as Timestamp).toDate(),
//             dateAdded: (notification["dateAdded"] as Timestamp).toDate());
//
//         if (appNotificationModel.isArchived == false) {
//           if (!fieldExistsRead) {
//             newNotificationCount += 1;
//           } else {
//             if (notification["isRead"] == false) {
//               newNotificationCount += 1;
//             }
//           }
//
//           print(
//               "This is the notification title == ${appNotificationModel.notificationTitle}");
//
//           appNotifications.add(appNotificationModel);
//         }
//       }
//
//       if (newNotificationCount > 0) {
//         newNotification.value = true;
//       } else {
//         newNotification.value = false;
//       }
//     }
//
//     List<AppNotificationModel> notificationModelsAppDB =
//         await appDBNotifications.getNotifications();
//
//     List<AppNotificationModel> newList = [];
//
//     for (var notification in appNotifications) {
//       if (!notificationModelsAppDB.contains(notification)) {
//         newList.add(notification);
//       }
//     }
//
//     appDBNotifications.createMultipleNotifications(
//         appNotificationModels: newList);
//   }
//
//   updateNotification({required notificationId, required username}) async {
//     ResponseModel responseModel = await notificationImpl.updateNotification(
//         notificationId: notificationId);
//
//     if (!responseModel.isError) {
//       getNotification(username: username);
//     }
//   }
// }
