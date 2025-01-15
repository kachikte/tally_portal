import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_analytics_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_auth_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_resource_impl.dart';
import 'package:tally_portal/src/presentation/controllers/controllers.dart';
import 'package:tally_portal/src/presentation/controllers/notification_controller.dart';

class DocumentController extends GetxController {
  TextEditingController emailSignupController = TextEditingController();
  DocumentImpl documentImpl = DocumentImpl();
  // FirebaseAuthImpl firebaseAuthImpl = FirebaseAuthImpl();
  // FirebaseResourceImpl firebaseResourceImpl = FirebaseResourceImpl();
  ProfileController profileController = ProfileController();
  // NotificationController notificationController = NotificationController();
  // FirebaseAnalyticsImpl firebaseAnalyticsImpl = FirebaseAnalyticsImpl();

  Future<ResponseModel> uploadSingle(
      {required File file,
      required String documentCategory,
      required String userId}) {
    return documentImpl.uploadSingle(
        file: file, documentCategory: documentCategory, userId: userId);
  }
}
