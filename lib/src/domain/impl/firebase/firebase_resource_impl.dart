// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tally_portal/src/data/repository/firebase/firebase_resource_interface.dart';
// import 'package:tally_portal/src/domain/domain.dart';
// import 'package:tally_portal/src/presentation/controllers/controllers.dart';
//
// import '../../../data/source/remote/firebase/firebase_resource/firebase_app_resource.dart';
//
// class FirebaseResourceImpl implements FirebaseResourceInterface {
//   FirebaseAppResource firebaseAppResource = FirebaseAppResource();
//
//   @override
//   Future<ResponseModel> getNotificationToken() async {
//     ResponseModel responseModel = ResponseModel.empty();
//     try {
//       var response = await firebaseAppResource.getNotificationToken();
//       responseModel.isError = false;
//       responseModel.data = response;
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> updateNotificationToken({required String token}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var response =
//           await firebaseAppResource.updateNotificationToken(token: token);
//       responseModel.isError = false;
//       responseModel.data = response;
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> updateUniqueKey({required String uniqueKey}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var response =
//           await firebaseAppResource.updateUniqueKey(uniqueKey: uniqueKey);
//       responseModel.isError = false;
//       responseModel.data = response;
//     } catch (e) {
//       print("this is the update error === ");
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getUniqueKey({required String username}) async {
//     // TODO: implement getUserImage
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var response = await firebaseAppResource.getUniqueKey(username: username);
//       responseModel.isError = false;
//       responseModel.data = response;
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getUserImage({required String username}) async {
//     // TODO: implement getUserImage
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var response = await firebaseAppResource.getUserImage(username: username);
//       responseModel.isError = false;
//       responseModel.data = response;
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> updateUserImage({required String imageUrl}) async {
//     // TODO: implement updateUserImage
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var response =
//           await firebaseAppResource.updateUserImage(imageUrl: imageUrl);
//       responseModel.isError = false;
//       responseModel.data = response;
//     } catch (e) {
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> uploadUserImage({required File userImageFile}) async {
//     // TODO: implement uploadUserImage
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       var response = await firebaseAppResource.uploadUserImage(
//           userImageFile: userImageFile);
//       responseModel.isError = false;
//       responseModel.data = response;
//     } catch (e) {
//       print("this is the upload error === ${e.toString()}");
//       responseModel.isError = true;
//       responseModel.data = "";
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getSearchMessageRequestByUsername(
//       {required String userName, required String otherUserName}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     List<QueryDocumentSnapshot> data;
//     try {
//       data = await firebaseAppResource.getSearchMessageRequestByUsername(
//           userName: userName, otherUserName: otherUserName);
//       print("is empty == ${data.isEmpty}");
//       if (data.isEmpty) {
//         data = await firebaseAppResource.getSearchMessageRequestByUsername(
//             userName: otherUserName, otherUserName: userName);
//         print("is empty one == ${data.isEmpty}");
//         if (data.isNotEmpty) {
//           responseModel.data = data[0].data();
//           print("output one === ${responseModel.data}");
//           print("output one second === ${responseModel.data["acceptDeny"]}");
//         }
//       } else {
//         responseModel.data = data[0].data();
//         print("output two === ${responseModel.data}");
//         print("output two second === ${responseModel.data["acceptDeny"]}");
//       }
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getContactByUsername({required String userName}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     List<ContactModelFromDb> contacts = [];
//
//     List<QueryDocumentSnapshot> data;
//     try {
//       data = await firebaseAppResource.getContactByUsername(userName: userName);
//       print("is empty from contact by username== ${data.isNotEmpty}");
//       if (data.isNotEmpty) {
//         for (var contact in data) {
//           print("this is one snapshot data === ${contact.data()}");
//           ContactModelFromDb contactModelFromDb =
//               ContactModelFromDb.fromJsonWithId(
//                   id: contact.id, data: contact.data());
//           contacts.add(contactModelFromDb);
//         }
//       }
//       responseModel.data = contacts;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> createMessageRequest(
//       {required MessageRequestModel messageRequestModel,
//       required ProfileController profileController}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.createMessageRequest(
//           profileController: profileController,
//           messageRequestModel: messageRequestModel);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getChatActiveContactByUsername(
//       {required String userName}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     List<ContactModelFromDb> contacts = [];
//
//     List<QueryDocumentSnapshot> data;
//     try {
//       data = await firebaseAppResource.getChatActiveContactByUsername(
//           userName: userName);
//       print("is empty active contact by username== ${data.isNotEmpty}");
//       if (data.isNotEmpty) {
//         for (var contact in data) {
//           print("this is one snapshot data === ${contact.data()}");
//           ContactModelFromDb contactModelFromDb =
//               ContactModelFromDb.fromJsonWithId(
//                   id: contact.id, data: contact.data());
//           contacts.add(contactModelFromDb);
//         }
//       }
//
//       responseModel.data = contacts;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getMessageRequestByUsername(
//       {required String userName}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//     List<MessageRequestModelFromDb> messageReqs = [];
//
//     List<QueryDocumentSnapshot> data;
//     try {
//       data = await firebaseAppResource.getMessageRequestByUsername(
//           userName: userName);
//       print(
//           "is empty message request contact by username== ${data.isNotEmpty}");
//       if (data.isNotEmpty) {
//         for (var request in data) {
//           print("this is one snapshot data === ${request.data()}");
//           MessageRequestModelFromDb messageRequestModelFromDb =
//               MessageRequestModelFromDb.fromJsonWithId(
//                   id: request.id, data: request.data());
//           messageReqs.add(messageRequestModelFromDb);
//         }
//       }
//       responseModel.data = messageReqs;
//     } catch (e) {
//       print("this is the error message requests === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> updatePartner(
//       {required String otherDocumentId, required String documentId}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.updatePartner(
//           otherDocumentId: otherDocumentId, documentId: documentId);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> sendChat(
//       {required String userId,
//       required String message,
//       required String partnerId,
//       required ProfileController profileController}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.sendChat(
//           userId: userId,
//           message: message,
//           partnerId: partnerId,
//           profileController: profileController);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> updateChatActive(
//       {required String documentId, required String otherDocumentId}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.updateChatActive(
//           documentId: documentId, otherDocumentId: otherDocumentId);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> updateParticularPartner(
//       {required String otherDocumentId,
//       required String documentId,
//       required String message}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.updateParticularPartner(
//           otherDocumentId: otherDocumentId,
//           documentId: documentId,
//           message: message);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> createUserContact(
//       {required MessageRequestModelFromDb messageRequestModelFromDb,
//       required String partnerUser}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.createUserContact(
//           messageRequestModelFromDb: messageRequestModelFromDb,
//           partnerUser: partnerUser);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error from partner user === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getUserByUsername({required String username}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     String data;
//     try {
//       data = await firebaseAppResource.getUserByUsername(username: username);
//       print("this is the init partner user === $data");
//       if (data.isNotEmpty) {
//         // responseModel.data = data[0].id;
//         responseModel.data = data;
//       }
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> replyMessageRequest(
//       {required String reply,
//       required MessageRequestModelFromDb messageRequestModelFromDb}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.replyMessageRequest(
//           reply: reply, messageRequestModelFromDb: messageRequestModelFromDb);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> sendLegendChat(
//       {required String userId,
//       required String message,
//       required String faultId,
//       required String chatType,
//       required String uniqueKey,
//       required bool isButton,
//       required bool hasChosen}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     try {
//       await firebaseAppResource.sendLegendChat(
//           userId: userId,
//           message: message,
//           faultId: faultId,
//           chatType: chatType,
//           uniqueKey: uniqueKey,
//           isButton: isButton,
//           hasChosen: hasChosen);
//       responseModel.isError = false;
//     } catch (e) {
//       print("this is the error === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
//
//   @override
//   Future<ResponseModel> getInitialChats({required String uniqueToken}) async {
//     ResponseModel responseModel = ResponseModel.empty();
//
//     List<QueryDocumentSnapshot> data;
//     try {
//       data =
//           await firebaseAppResource.getInitialChats(uniqueToken: uniqueToken);
//       print("is initial chats empty == ${data.isNotEmpty}");
//       if (data.isNotEmpty) {
//         responseModel.data = data.length;
//       } else {
//         responseModel.data = 0;
//       }
//     } catch (e) {
//       print("this is the error initial chat === ${e.toString()}");
//       responseModel.isError = true;
//     }
//
//     return responseModel;
//   }
// }
