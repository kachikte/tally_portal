// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ContactModelFromDb {
//   late String id;
//   late String ownerImageUrl;
//   late String ownerName;
//   late String ownerUserId;
//   late String contactImageUrl;
//   late String contactName;
//   late String contactUserId;
//   late bool isChatActive;
//   late String otherDocumentId;
//   late String lastMessage;
//   late bool isRead;
//   late int numberOfUnreadMessages;
//   late String deliveryStatus;
//   late dynamic dateAdded;
//   late dynamic updatedAt;
//   late dynamic lastConversationDate;
//
//   ContactModelFromDb.fromJson(var data) {
//     id = "";
//     ownerImageUrl = data["ownerImageUrl"];
//     ownerName = data["ownerName"];
//     ownerUserId = data["ownerUserId"];
//     contactImageUrl = data["contactImageUrl"];
//     contactName = data["contactName"];
//     contactUserId = data["contactUserId"];
//     isChatActive = data["isChatActive"];
//     otherDocumentId = data["otherDocumentId"];
//     lastMessage = data["lastMessage"];
//     isRead = data["isRead"];
//     deliveryStatus = data["deliveryStatus"];
//     numberOfUnreadMessages = data["numberOfUnreadMessages"];
//     dateAdded = (data["dateAdded"] as Timestamp).toDate();
//     updatedAt = (data["updatedAt"] as Timestamp).toDate();
//     lastConversationDate = (data["lastConversationDate"] as Timestamp).toDate();
//   }
//
//   ContactModelFromDb.fromJsonWithId({required this.id, required var data}) {
//     ownerImageUrl = data["ownerImageUrl"];
//     ownerName = data["ownerName"];
//     ownerUserId = data["ownerUserId"];
//     contactImageUrl = data["contactImageUrl"];
//     contactName = data["contactName"];
//     contactUserId = data["contactUserId"];
//     isChatActive = data["isChatActive"];
//     otherDocumentId = data["otherDocumentId"];
//     lastMessage = data["lastMessage"];
//     isRead = data["isRead"];
//     deliveryStatus = data["deliveryStatus"];
//     numberOfUnreadMessages = data["numberOfUnreadMessages"];
//     dateAdded = (data["dateAdded"] as Timestamp).toDate();
//     updatedAt = (data["updatedAt"] as Timestamp).toDate();
//     lastConversationDate = (data["lastConversationDate"] as Timestamp).toDate();
//   }
// }