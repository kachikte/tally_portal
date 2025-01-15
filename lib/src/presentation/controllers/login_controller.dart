import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_analytics_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_auth_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_resource_impl.dart';
import 'package:tally_portal/src/domain/models/user_profile_model.dart';
import 'package:tally_portal/src/presentation/controllers/controllers.dart';
import 'package:tally_portal/src/presentation/controllers/notification_controller.dart';
import 'package:tally_portal/src/service/service.dart';
import 'package:tally_portal/src/utils/stored_keys.dart';
import 'package:tally_portal/src/utils/util_functions.dart';
import 'package:tally_portal/src/utils/utils.dart';

class LoginController extends GetxController {
  LoginImpl loginImpl = LoginImpl();

  RxString userId = ''.obs;

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  AppDBNotifications appDBNotifications = AppDBNotifications();

  // NotificationController notificationController = Get.find();

  // FirebaseAuthImpl firebaseAuthImpl = FirebaseAuthImpl();
  //
  // FirebaseResourceImpl firebaseResourceImpl = FirebaseResourceImpl();
  //
  // FirebaseAnalyticsImpl firebaseAnalyticsImpl = FirebaseAnalyticsImpl();

  ProfileController profileController = Get.find();

  void setObscure() {
    isObscure.value = !isObscure.value;
  }

  void setIsRememberMe(value) {
    isRememberMe.value = !isRememberMe.value;
  }

  RxBool isRememberMe = false.obs;

  RxBool isObscure = true.obs;

  final formKey = GlobalKey<FormState>();

  checkOnLogin() async {
    bool rememberMe = profileController.getRememberMeValue();

    if (rememberMe) {
      usernameController.text = profileController.emailGeneralStorage
          .readFromBox(key: StoredKeys.EMAIL);
      passwordController.text =
          (await SecuredStorage.readData(key: StoredKeys.PASSWORD))!;
    } else {
      usernameController.text = '';
      passwordController.text = '';
    }

    isRememberMe.value = rememberMe;

    await profileController.getAppInfo();
  }

  Future<ResponseModel> login(LoginDto loginDto) {
    return loginImpl.login(loginDto: loginDto);
  }

  void submit(BuildContext context) async {
    //check if the form is validated
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    //Show loader
    UtilFunctions.showOverLay(context);

    // formKey.currentState!.save();

    bool rememberMe = profileController.getRememberMeValue();

    if (rememberMe) {
      print("To delete db === $rememberMe");
      String username = profileController.getUsernameValue();
      print("To delete db one === $username");
      print("To delete db two === ${usernameController.text}");
      print("To delete db three === ${usernameController.text != username}");
      if (usernameController.text != username) {
        await appDBNotifications.dropNotificationTable();
      }
    }

    LoginDto loginDto = LoginDto(
        username: usernameController.text.trim(),
        password: passwordController.text.trim());

    print("this is coming hereeee == |");
    ResponseModel responseModel = await loginImpl.login(loginDto: loginDto);

    bool canContinue = true;

    log('The erroor coming d - ${responseModel.isError} ${responseModel.data}');
    if (responseModel.isError) {
      if (context.mounted) {
        UtilFunctions.hideOverLay(context);
      }
      UtilFunctions.getSnack(
          title: "Login Error",
          message: responseModel.data,
          colorText: AppColors.lightBackgroundColor,
          backgroundColor: AppColors.tallyColor);

      // UtilFunctions.getSnack(title: "Login Error", message: "Could not connect, Please try again", colorText: AppColors.lightBackgroundColor, backgroundColor: AppColors.primaryColor);

      canContinue = false;
    } else {
      log('This is the response data - ${responseModel.data}');
      log('This is the response data field - ${responseModel.data['email']}');

      LoginModel loginModel = LoginModel.fromJson(json: responseModel.data);

      userId.value = responseModel.data['userId'];

      await SecuredStorage.writeData(
          storageModel: StorageModel(
              key: StoredKeys.TOKEN, value: loginModel.accessToken));
      await SecuredStorage.writeData(
          storageModel: StorageModel(
              key: StoredKeys.AUTH, value: loginModel.authorization));

      if (isRememberMe.value) {
        profileController.rememberMeGeneralStorage.writeToBox(
            storageModel: StorageModel(
                key: StoredKeys.REMEMBERME,
                value: isRememberMe.value.toString()));
        await SecuredStorage.writeData(
            storageModel: StorageModel(
                key: StoredKeys.PASSWORD, value: loginDto.password));
      } else {
        profileController.rememberMeGeneralStorage
            .removeBox(key: StoredKeys.REMEMBERME);
        await SecuredStorage.delete(key: StoredKeys.PASSWORD);
      }

      if (context.mounted) {
        loginFinal(
            context: context,
            authorization: loginModel.authorization,
            token: loginModel.accessToken,
            password: loginDto.password);
      }
    }
  }

  loginFinal(
      {required BuildContext context,
      required String authorization,
      required String token,
      required String password}) async {

    // final SocketService _socketService = SocketService();

    log('Comig innnto final');

    await SharedPrefStorage.saveToken(token);

    ResponseModel responseModelProfile = await profileController.getProfile(
        authorization: authorization, accessToken: token);

    if (!responseModelProfile.isError) {
      log("Rntering herre profile details === ${responseModelProfile.data}");
      UserProfileModel userProfileModel =
          responseModelProfile.data as UserProfileModel;

      // firebaseAuthImpl.getUsernameExistence(
      //     username: userProfileModel.username,
      //     email: userProfileModel.email,
      //     password: password);

      // ResponseModel responseModelUserImage = await firebaseResourceImpl
      //     .getUserImage(username: userProfileModel.username);
      // ResponseModel responseModelUserUniqueKey = await firebaseResourceImpl
      //     .getUniqueKey(username: userProfileModel.username);

      profileController.setProfileValues(
          userProfileModel: userProfileModel, uniqueKey: "");

      // firebaseAnalyticsImpl.addAppOpenAnalytics();
      // firebaseAnalyticsImpl.addLoginAnalytics(
      //     firstName: userProfileModel.firstName,
      //     lastName: userProfileModel.lastName,
      //     username: userProfileModel.email);
      // firebaseAnalyticsImpl.randomLogAnalytics();

      // ticketController.setTicketsLocal();

      print("coming here");
      // await notificationController.getNotification(
      //     username: userProfileModel.email);

      profileController.getProfileValues();
      const serverUrl = ApiUrls.url;
      var deviceId = Constants.deviceId;

      // Connect the user when the app starts
      // _socketService.connect(serverUrl, userId.value, deviceId);
      if (context.mounted) {
        UtilFunctions.hideOverLay(context);
      }
      Get.offAndToNamed(AppRoutes.dashboard);
      // Get.offAndToNamed(AppRoutes.tripHome);
    }

    log("Rntering herre profile detailserror === ${responseModelProfile.data}");
    if (context.mounted) {
      UtilFunctions.hideOverLay(context);
      UtilFunctions.showTopSnackError(context, responseModelProfile.data);
    }
  }
}
