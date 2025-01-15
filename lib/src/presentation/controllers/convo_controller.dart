// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:tally_portal/src/config/app_colors.dart';
// import 'package:tally_portal/src/domain/domain.dart';
// import 'package:tally_portal/src/domain/impl/firebase/firebase_resource_impl.dart';
// import 'package:tally_portal/src/utils/util_functions.dart';
//
// class ConvoController extends GetxController {
//   FirebaseResourceImpl firebaseResourceImpl = FirebaseResourceImpl();
//
//   RxBool activeContactLoading = false.obs;
//   RxBool contactLoading = false.obs;
//   RxBool messageRequestLoading = false.obs;
//
//   RxBool isSearching = false.obs;
//   RxList chatUsernames = [].obs;
//   RxInt page = 0.obs;
//   RxBool usernameSearch = false.obs;
//   TextEditingController usernameSearchController = TextEditingController();
//
//   RxList activeContactModelFromDb = [].obs;
//   RxList messageRequestsFromDb = [].obs;
//   RxList contactModelFromDb = [].obs;
//
//   clearConvo() {
//     activeContactModelFromDb = [].obs;
//     messageRequestsFromDb = [].obs;
//     contactModelFromDb = [].obs;
//   }
//
//   void setPage(int page) {
//     this.page.value = page;
//   }
//
//   Future getChatActiveContactByUsername({required String username}) async {
//     print("this is the username === $username");
//
//     activeContactLoading.value = true;
//     ResponseModel responseModel = await firebaseResourceImpl
//         .getChatActiveContactByUsername(userName: username);
//
//     if (responseModel.isError) {
//       activeContactLoading.value = false;
//       UtilFunctions.getSnack(
//           title: "Error",
//           message: "Error fetching active contacts",
//           colorText: AppColors.lightBackgroundColor,
//           backgroundColor: AppColors.tallyColor);
//     } else {
//       if ((responseModel.data as List<ContactModelFromDb>).isNotEmpty) {
//         activeContactModelFromDb.value.clear();
//         for (var contact in responseModel.data as List<ContactModelFromDb>) {
//           activeContactModelFromDb.add(contact);
//         }
//       }
//
//       activeContactLoading.value = false;
//     }
//   }
//
//   Future getContactByUsername({required String username}) async {
//     contactLoading.value = true;
//     ResponseModel responseModel =
//         await firebaseResourceImpl.getContactByUsername(userName: username);
//
//     if (responseModel.isError) {
//       contactLoading.value = false;
//       UtilFunctions.getSnack(
//           title: "Error",
//           message: "Error fetching active contacts",
//           colorText: AppColors.lightBackgroundColor,
//           backgroundColor: AppColors.tallyColor);
//     } else {
//       if ((responseModel.data as List<ContactModelFromDb>).isNotEmpty) {
//         contactModelFromDb.value.clear();
//         for (var contact in responseModel.data as List<ContactModelFromDb>) {
//           contactModelFromDb.add(contact);
//         }
//       }
//
//       contactLoading.value = false;
//     }
//   }
//
//   Future getMessageRequestByUsername({required String username}) async {
//     messageRequestLoading.value = true;
//     ResponseModel responseModel = await firebaseResourceImpl
//         .getMessageRequestByUsername(userName: username);
//
//     if (responseModel.isError) {
//       messageRequestLoading.value = false;
//       UtilFunctions.getSnack(
//           title: "Error",
//           message: "Error fetching message requests",
//           colorText: AppColors.lightBackgroundColor,
//           backgroundColor: AppColors.tallyColor);
//     } else {
//       if ((responseModel.data as List<MessageRequestModelFromDb>).isNotEmpty) {
//         messageRequestsFromDb.value.clear();
//         for (var request
//             in responseModel.data as List<MessageRequestModelFromDb>) {
//           messageRequestsFromDb.add(request);
//         }
//       }
//
//       messageRequestLoading.value = false;
//     }
//   }
//
//   replyMessageRequest(
//       {required String reply,
//       required MessageRequestModelFromDb messageRequestModelFromDb}) async {
//     ResponseModel responseModelRequest =
//         await firebaseResourceImpl.replyMessageRequest(
//             reply: reply, messageRequestModelFromDb: messageRequestModelFromDb);
//     if (!responseModelRequest.isError) {
//       if (reply == "accept") {
//         ResponseModel responseModel =
//             await firebaseResourceImpl.getUserByUsername(
//                 username: messageRequestModelFromDb.senderUserName);
//         if (!responseModel.isError) {
//           await firebaseResourceImpl.createUserContact(
//               messageRequestModelFromDb: messageRequestModelFromDb,
//               partnerUser: responseModel.data);
//         } else {
//           UtilFunctions.getSnack(
//               title: "Error",
//               message: "Error getting partner user",
//               colorText: AppColors.lightBackgroundColor,
//               backgroundColor: AppColors.tallyColor);
//         }
//       }
//     } else {
//       UtilFunctions.getSnack(
//           title: "Error",
//           message: "Error replying request",
//           colorText: AppColors.lightBackgroundColor,
//           backgroundColor: AppColors.tallyColor);
//     }
//   }
// }
