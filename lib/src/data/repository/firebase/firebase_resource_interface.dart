import 'dart:io';

import 'package:tally_portal/src/presentation/controllers/controllers.dart';

import '../../../domain/models/chat/message_request_model.dart';
import '../../../domain/models/chat/message_request_model_from_db.dart';
import '../../../domain/models/response_model.dart';

abstract class FirebaseResourceInterface {
  Future<ResponseModel> getNotificationToken();

  Future<ResponseModel> updateNotificationToken({required String token});

  Future<ResponseModel> updateUniqueKey({required String uniqueKey});

  Future<ResponseModel> getUniqueKey({required String username});

  Future<ResponseModel> getUserImage({required String username});

  Future<ResponseModel> uploadUserImage({required File userImageFile});

  Future<ResponseModel> updateUserImage({required String imageUrl});

  Future<ResponseModel> getSearchMessageRequestByUsername(
      {required String userName, required String otherUserName});

  Future<ResponseModel> getContactByUsername({required String userName});

  Future<ResponseModel> createMessageRequest(
      {required MessageRequestModel messageRequestModel,
      required ProfileController profileController});

  Future<ResponseModel> getChatActiveContactByUsername(
      {required String userName});

  Future<ResponseModel> getMessageRequestByUsername({required String userName});

  Future<ResponseModel> updatePartner(
      {required String otherDocumentId, required String documentId});

  Future<ResponseModel> sendChat(
      {required String userId,
      required String message,
      required String partnerId,
      required ProfileController profileController});

  Future<ResponseModel> updateChatActive(
      {required String documentId, required String otherDocumentId});

  Future<ResponseModel> updateParticularPartner(
      {required String otherDocumentId,
      required String documentId,
      required String message});

  // Future<ResponseModel> replyMessageRequest(
  //     {required String reply,
  //     required MessageRequestModelFromDb messageRequestModelFromDb});
  //
  // Future<ResponseModel> createUserContact(
  //     {required MessageRequestModelFromDb messageRequestModelFromDb,
  //     required String partnerUser});

  Future<ResponseModel> getUserByUsername({required String username});

  Future<ResponseModel> getInitialChats({required String uniqueToken});

  Future<ResponseModel> sendLegendChat(
      {required String userId,
      required String message,
      required String faultId,
      required String chatType,
      required String uniqueKey,
      required bool isButton,
      required bool hasChosen});
}
