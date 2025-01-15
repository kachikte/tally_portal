// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:tally_portal/src/data/data.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/firebase_auth/firebase_app_auth.dart';
// import 'package:tally_portal/src/data/source/remote/firebase/notifications/send_notification.dart';
// import 'package:tally_portal/src/domain/domain.dart';
// import 'package:tally_portal/src/presentation/controllers/controllers.dart';
// import 'package:tally_portal/src/utils/utils.dart';
// import 'package:uuid/uuid.dart';
//
// class FirebaseAppResource {
//   var firebaseFirestore = FirebaseFirestore.instance;
//
//   var firebaseMessaging = FirebaseMessaging.instance;
//
//   var firebaseStorage = FirebaseStorage.instance;
//
//   final ProfileRemoteSource profileRemoteSource = ProfileRemoteSource();
//
//   final SendNotification sendNotification = SendNotification();
//
//   Future getUserByUsername({required String username}) async {
//     var res = await firebaseFirestore
//         .collection('users')
//         .where('username', whereIn: [username])
//         .get()
//         .then((value) {
//           print(
//               "this is the partner firebase user DOC ==== ${value.docs[0].id}");
//           return value.docs[0].id;
//         });
//
//     return res;
//   }
//
//   getNotificationToken() async {
//     firebaseMessaging.onTokenRefresh.listen((token) {
//       print('THIS IS THE REFRESHED TOKEN === $token');
//     });
//
//     String refreshedToken = (await firebaseMessaging.getToken())!;
//     print('THIS IS THE REFRESHED TOKEN again === $refreshedToken');
//
//     await profileRemoteSource.updateNotificationToken(
//         notificationToken: refreshedToken);
//
//     await updateNotificationToken(token: refreshedToken);
//
//     return refreshedToken;
//   }
//
//   updateNotificationToken({required String token}) async {
//     FirebaseAppAuth firebaseAppAuth = FirebaseAppAuth();
//
//     var userId = await firebaseAppAuth.getCurrentUser();
//
//     print("this is now the notf user id -- $userId");
//     print("this is the new token to be put === $token");
//
//     await firebaseFirestore
//         .collection('users')
//         .doc(userId)
//         .update({"notification_token": token});
//   }
//
//   updateUniqueKey({required String uniqueKey}) async {
//     FirebaseAppAuth firebaseAppAuth = FirebaseAppAuth();
//
//     var userId = await firebaseAppAuth.getCurrentUser();
//
//     await firebaseFirestore
//         .collection('users')
//         .doc(userId)
//         .update({"uniqueKey": uniqueKey});
//   }
//
//   getUniqueKey({required String username}) async {
//     String res = await firebaseFirestore
//         .collection('users')
//         .where('username', isEqualTo: username)
//         .get()
//         .then((value) {
//       return value.docs[0]['uniqueKey'];
//     });
//
//     return res;
//   }
//
//   getUserImage({required String username}) async {
//     String res = await firebaseFirestore
//         .collection('users')
//         .where('username', isEqualTo: username)
//         .get()
//         .then((value) {
//       return value.docs[0]['imageUrl'];
//     });
//
//     return res;
//   }
//
//   uploadUserImage({required File userImageFile}) async {
//     FirebaseAppAuth firebaseAppAuth = FirebaseAppAuth();
//
//     var userId = await firebaseAppAuth.getCurrentUser();
//
//     String imageString = '${userId}user.jpg';
//
//     final ref =
//         firebaseStorage.ref().child('profile_images').child(imageString);
//
//     final taskUpload = await ref.putFile(userImageFile);
//
//     String url = await taskUpload.ref.getDownloadURL();
//
//     return url;
//   }
//
//   updateUserImage({required String imageUrl}) async {
//     FirebaseAppAuth firebaseAppAuth = FirebaseAppAuth();
//
//     var userId = await firebaseAppAuth.getCurrentUser();
//
//     firebaseFirestore
//         .collection('users')
//         .doc(userId.toString())
//         .update({'updatedAt': DateTime.now(), 'imageUrl': imageUrl});
//   }
//
//   //chats
//
//   getInitialChats({required String uniqueToken}) async {
//     var res = await firebaseFirestore
//         .collection('legendChat')
//         .where('uniqueKey', isEqualTo: uniqueToken)
//         .where('isActive', isEqualTo: true)
//         .orderBy('dateAdded')
//         .limit(6)
//         .get();
//
//     return res.docs;
//   }
//
//   getSearchMessageRequestByUsername(
//       {required String userName, required String otherUserName}) async {
//     var res = await firebaseFirestore
//         .collection('messageRequests')
//         .where("recieverUserName", isEqualTo: userName)
//         .where("senderUserName", isEqualTo: otherUserName)
//         .get();
//
//     return res.docs;
//   }
//
//   getContactByUsername({required String userName}) async {
//     var res = await firebaseFirestore
//         .collection('contacts')
//         .where("ownerName", isEqualTo: userName)
//         .get();
//
//     return res.docs;
//   }
//
//   createMessageRequest(
//       {required MessageRequestModel messageRequestModel,
//       required ProfileController profileController}) async {
//     String messageRequestId = const Uuid().v4();
//
//     firebaseFirestore.collection('messageRequests').doc(messageRequestId).set({
//       "senderImageUrl": messageRequestModel.senderImageUrl,
//       "senderUserName": messageRequestModel.senderUserName,
//       "recieverImageUrl": messageRequestModel.recieverImageUrl,
//       "recieverUserName": messageRequestModel.recieverUserName,
//       "acceptDeny": messageRequestModel.acceptDeny,
//       "dateAdded": DateTime.now(),
//       'updatedAt': DateTime.now(),
//     });
//
//     sendNotification.sendToSpecificUserName(
//         title: "Chat Request",
//         body: TallyNotificationConstants.messageRequest(
//             name: profileController.appUserModel.firstName.value,
//             username: messageRequestModel.senderUserName),
//         username: messageRequestModel.recieverUserName);
//   }
//
//   getChatActiveContactByUsername({required String userName}) async {
//     var res = await firebaseFirestore
//         .collection('contacts')
//         .where("ownerName", isEqualTo: userName)
//         .where("isChatActive", isEqualTo: true)
//         .get();
//
//     return res.docs;
//   }
//
//   getMessageRequestByUsername({required String userName}) async {
//     var res = await firebaseFirestore
//         .collection('messageRequests')
//         .where("recieverUserName", isEqualTo: userName)
//         .get();
//
//     return res.docs;
//   }
//
//   replyMessageRequest(
//       {required String reply,
//       required MessageRequestModelFromDb messageRequestModelFromDb}) async {
//     print("this is the message id === ${messageRequestModelFromDb.id}");
//     await firebaseFirestore
//         .collection('messageRequests')
//         .doc(messageRequestModelFromDb.id)
//         .update({
//       "senderImageUrl": messageRequestModelFromDb.senderImageUrl,
//       "senderUserName": messageRequestModelFromDb.senderUserName,
//       "recieverImageUrl": messageRequestModelFromDb.recieverImageUrl,
//       "recieverUserName": messageRequestModelFromDb.recieverUserName,
//       "acceptDeny": reply,
//       "dateAdded": messageRequestModelFromDb.dateAdded,
//       'updatedAt': messageRequestModelFromDb.updatedAt,
//     });
//
//     if (reply == StoredKeys.ACCEPT) {
//       sendNotification.sendToSpecificUserName(
//           title: "Chat Request",
//           body: TallyNotificationConstants.messageRequestReply(
//               username: messageRequestModelFromDb.recieverUserName,
//               reply: reply),
//           username: messageRequestModelFromDb.senderUserName);
//     }
//   }
//
//   createUserContact(
//       {required MessageRequestModelFromDb messageRequestModelFromDb,
//       required String partnerUser}) async {
//     String contactId = const Uuid().v4();
//     String contactIdNext = const Uuid().v4();
//
//     var currentUser = FirebaseAuth.instance.currentUser?.uid;
//
//     print("getting this one now one === $currentUser");
//
//     print("getting this one now two === $partnerUser");
//
//     FirebaseFirestore.instance.collection('contacts').doc(contactId).set({
//       "lastMessage": "",
//       "isRead": true,
//       "numberOfUnreadMessages": 0,
//       "otherDocumentId": contactIdNext,
//       "isChatActive": false,
//       "ownerImageUrl": messageRequestModelFromDb.senderImageUrl,
//       "ownerName": messageRequestModelFromDb.senderUserName,
//       "ownerUserId": partnerUser,
//       "contactImageUrl": messageRequestModelFromDb.recieverImageUrl,
//       "contactName": messageRequestModelFromDb.recieverUserName,
//       "contactUserId": currentUser,
//       "deliveryStatus": DeliveryStatus.NONE,
//       "dateAdded": DateTime.now(),
//       'updatedAt': DateTime.now(),
//       "lastConversationDate": DateTime.now()
//     });
//
//     FirebaseFirestore.instance.collection('contacts').doc(contactIdNext).set({
//       "lastMessage": "",
//       "isRead": true,
//       "numberOfUnreadMessages": 0,
//       "otherDocumentId": contactId,
//       "isChatActive": false,
//       "ownerImageUrl": messageRequestModelFromDb.recieverImageUrl,
//       "ownerName": messageRequestModelFromDb.recieverUserName,
//       "ownerUserId": currentUser,
//       "contactImageUrl": messageRequestModelFromDb.senderImageUrl,
//       "contactName": messageRequestModelFromDb.senderUserName,
//       "contactUserId": partnerUser,
//       "deliveryStatus": DeliveryStatus.NONE,
//       "dateAdded": DateTime.now(),
//       'updatedAt': DateTime.now(),
//       "lastConversationDate": DateTime.now()
//     });
//   }
//
//   updatePartner(
//       {required String otherDocumentId, required String documentId}) async {
//     await firebaseFirestore.collection('contacts').doc(documentId).update({
//       "deliveryStatus": DeliveryStatus.SEEN,
//     });
//
//     await firebaseFirestore.collection('contacts').doc(otherDocumentId).update({
//       "isRead": true,
//       "numberOfUnreadMessages": 0,
//     });
//   }
//
//   sendChat(
//       {required String userId,
//       required String message,
//       required String partnerId,
//       required ProfileController profileController}) async {
//     await firebaseFirestore.collection('chat').doc(UniqueKey().toString()).set({
//       "userId": userId,
//       "message": message,
//       "dateAdded": DateTime.now(),
//       "recipientId": partnerId
//     });
//
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(partnerId)
//         .get()
//         .then((value) async {
//       print("This is the value === $value");
//       sendNotification.sendToSpecificUserName(
//           title: TallyNotificationConstants.chatNotificationTitle(
//               name: profileController.appUserModel.firstName.value,
//               username: profileController.appUserModel.email.value),
//           body:
//               TallyNotificationConstants.chatNotificationBody(message: message),
//           username: value["username"]);
//     });
//   }
//
//   updateChatActive(
//       {required String documentId, required String otherDocumentId}) async {
//     await firebaseFirestore
//         .collection('contacts')
//         .doc(documentId)
//         .update({"isChatActive": true});
//
//     await firebaseFirestore
//         .collection('contacts')
//         .doc(otherDocumentId)
//         .update({"isChatActive": true});
//   }
//
//   updateParticularPartner(
//       {required String otherDocumentId,
//       required String documentId,
//       required String message}) async {
//     var unread = await firebaseFirestore
//         .collection('contacts')
//         .doc(otherDocumentId)
//         .get()
//         .then((value) {
//       print(
//           "this is the partner firebase number of unread ==== ${value.data()!["numberOfUnreadMessages"]}");
//       return value.data()!["numberOfUnreadMessages"];
//     });
//
//     await firebaseFirestore.collection('contacts').doc(documentId).update({
//       "deliveryStatus": DeliveryStatus.SENT,
//       "lastMessage": message,
//       "isRead": true,
//       "lastConversationDate": DateTime.now()
//     });
//
//     await FirebaseFirestore.instance
//         .collection('contacts')
//         .doc(otherDocumentId)
//         .update({
//       "lastMessage": message,
//       "isRead": false,
//       "numberOfUnreadMessages": unread + 1,
//       "lastConversationDate": DateTime.now()
//     });
//   }
//
//   //legend chats
//
//   sendLegendChat(
//       {required String userId,
//       required String message,
//       required String faultId,
//       required String chatType,
//       required String uniqueKey,
//       required bool isButton,
//       required bool hasChosen}) async {
//     await firebaseFirestore
//         .collection('legendChat')
//         .doc(UniqueKey().toString())
//         .set({
//       "userId": userId,
//       "message": message,
//       "dateAdded": DateTime.now(),
//       "faultId": faultId,
//       "isActive": true,
//       "hasChosen": hasChosen,
//       "chatType": chatType,
//       'uniqueKey': uniqueKey,
//       'isButton': isButton
//     });
//   }
// }
