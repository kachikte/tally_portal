// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class MessageRequestModelFromDb {
//   late String id;
//   late String senderImageUrl;
//   late String senderUserName;
//   late String recieverImageUrl;
//   late String recieverUserName;
//   late String acceptDeny;
//   late dynamic dateAdded;
//   late dynamic updatedAt;
//
//   MessageRequestModelFromDb.fromJson(var data) {
//     id = "";
//     senderUserName = data["senderUserName"];
//     senderImageUrl = data["senderImageUrl"];
//     recieverImageUrl = data["recieverImageUrl"];
//     recieverUserName = data["recieverUserName"];
//     acceptDeny = data["acceptDeny"];
//     dateAdded = (data["dateAdded"] as Timestamp).toDate();
//     updatedAt = (data["updatedAt"] as Timestamp).toDate();
//   }
//
//   MessageRequestModelFromDb.fromJsonWithId({required String id, required var data}) {
//     this.id =id;
//     senderUserName = data["senderUserName"];
//     senderImageUrl = data["senderImageUrl"];
//     recieverImageUrl = data["recieverImageUrl"];
//     recieverUserName = data["recieverUserName"];
//     acceptDeny = data["acceptDeny"];
//     dateAdded = (data["dateAdded"] as Timestamp).toDate();
//     updatedAt = (data["updatedAt"] as Timestamp).toDate();
//   }
// }