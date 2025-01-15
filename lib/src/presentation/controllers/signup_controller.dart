import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_analytics_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_auth_impl.dart';
import 'package:tally_portal/src/domain/impl/firebase/firebase_resource_impl.dart';
import 'package:tally_portal/src/domain/impl/signup_impl.dart';
import 'package:tally_portal/src/presentation/controllers/controllers.dart';
import 'package:tally_portal/src/presentation/controllers/notification_controller.dart';

class SignupController extends GetxController {
  RxString userId = "".obs;
  RxString otp = "".obs;

  TextEditingController emailSignupController = TextEditingController();
  SignUpImpl signUpImpl = SignUpImpl();
  // FirebaseAuthImpl firebaseAuthImpl = FirebaseAuthImpl();
  // FirebaseResourceImpl firebaseResourceImpl = FirebaseResourceImpl();
  ProfileController profileController = ProfileController();
  // NotificationController notificationController = NotificationController();
  // FirebaseAnalyticsImpl firebaseAnalyticsImpl = FirebaseAnalyticsImpl();

  void setObscure() {
    isObscure.value = !isObscure.value;
  }

  void setIsRememberMe(value) {
    isRememberMe.value = !isRememberMe.value;
  }

  RxBool isRememberMe = false.obs;

  RxBool isObscure = true.obs;

  Future<ResponseModel> signUp(SignUpDto signUpDto) {
    return signUpImpl.signUp(signUpDto: signUpDto);
  }

  Future<ResponseModel> verifyOtp(VerifyOtpDto verifyOtpDto) {
    return signUpImpl.verifyOtp(verifyOtpDto: verifyOtpDto);
  }

  Future<ResponseModel> personalInfo(PersonalInfoDto personalInfoDto) {
    return signUpImpl.personalInfo(personalInfoDto: personalInfoDto);
  }

  Future<ResponseModel> otherInfo(DriverOtherInfoDto driverOtherInfoDto) {
    return signUpImpl.otherInfo(driverOtherInfoDto: driverOtherInfoDto);
  }

  Future<ResponseModel> carDocuments(CarDocumentDto carDocumentDto) {
    return signUpImpl.carDocuments(carDocumentDto: carDocumentDto);
  }

  Future<ResponseModel> initForgotPassword(String email) {
    return signUpImpl.initForgotPassword(email: email);
  }

  Future<ResponseModel> forgotPassword(String otp, String password) {
    return signUpImpl.forgotPassword(otp: otp, password: password);
  }
}
