import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/domain/impl/customer_support_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_analytics_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_auth_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_resource_impl.dart';
import 'package:tally_portal/src/presentation/controllers/controllers.dart';
import 'package:tally_portal/src/utils/stored_keys.dart';

class SupportController extends GetxController {
  CustomerSupportImpl customerSupportImpl = CustomerSupportImpl();

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  AppDBNotifications appDBNotifications = AppDBNotifications();

  // NotificationController notificationController = Get.find();

  // FirebaseAuthImpl firebaseAuthImpl = FirebaseAuthImpl();
  //
  // FirebaseResourceImpl firebaseResourceImpl = FirebaseResourceImpl();
  //
  // FirebaseAnalyticsImpl firebaseAnalyticsImpl = FirebaseAnalyticsImpl();

  // ProfileController profileController = Get.find();

  submitSupport({required ProfileController profileController}) async {
    String? token = await SecuredStorage.readData(key: StoredKeys.TOKEN);
    String? auth = await SecuredStorage.readData(key: StoredKeys.AUTH);

    CustomerSupportDto customerSupportDto = CustomerSupportDto(
        ownerFirstname: profileController.appUserModel.firstName.value,
        ownerLastname: profileController.appUserModel.lastName.value,
        ownerPhone: profileController.appUserModel.phone.value,
        ownerEmail: profileController.appUserModel.email.value,
        title: titleController.text,
        description: descriptionController.text,
        date: DateTime.now().toLocal().toString().split(' ')[0]);

    ResponseModel responseModel = await customerSupportImpl.submitSupport(
        authorization: auth!,
        accessToken: token!,
        customerSupportDto: customerSupportDto);

    titleController.clear();
    descriptionController.clear();

    return responseModel;
  }
}
