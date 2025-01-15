import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/presentation/presentation.dart';
import 'package:tally_portal/src/service/socket_service.dart';
import 'package:tally_portal/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // LoginController loginController = LoginController();

  LoginController loginController = Get.find();

  final SocketService _socketService = SocketService();

  // Future<void> login() async {
  //   // loginController.checkOnLogin();
  //
  //   if (loginController.usernameController.text == '' ||
  //       loginController.passwordController.text == '') {
  //     UtilFunctions.showTopSnackError(context, 'Missing fields');
  //     return;
  //   }
  //   UtilFunctions.showOverLay(context);
  //   LoginDto loginDto = LoginDto(
  //       username: loginController.usernameController.text,
  //       password: loginController.passwordController.text);
  //   ResponseModel responseModel = await loginController.login(loginDto);
  //   log('Login loojout - ${responseModel.data}');
  //   if (context.mounted) {
  //     UtilFunctions.hideOverLay(context);
  //     if (responseModel.isError) {
  //       UtilFunctions.showTopSnackError(context, responseModel.data);
  //     } else {
  //       log('Has been registered - ${responseModel.data}');
  //       // signupController.userId.value = responseModel.data['insertedId'];
  //       // Replace with your server URL
  //       const serverUrl = ApiUrls.url;
  //       var userId = responseModel.data['insertedId'];
  //       var deviceId = Constants.deviceId;
  //
  //       // Connect the user when the app starts
  //       _socketService.connect(serverUrl, userId, deviceId);
  //       Get.toNamed(AppRoutes.locationChecker);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;


    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.tallyColor.withOpacity(.4),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color:  AppColors.lightBackgroundColor
          ),
          margin: EdgeInsets.symmetric(horizontal: width * .3, vertical: height * .15),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .025,
              ),
              Image.asset(AppImages.tallyLogoPng, width: width * .3, height: height * .05,),
              SizedBox(
                height: height * .025,
              ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: height * .025,
              ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Enter your credentials to access your account",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: height * .025,
              ),
              AppInput(
                  textEditingController: loginController.usernameController,
                  hintText: "Enter Email",
                  icon: const Icon(Icons.mail),
                  errorText: "Please enter your Email",
                  width: width,
                  label: "Email Address",
                  height: height),
              Obx(() => AppInput(
                  textEditingController: loginController.passwordController,
                  icon: const Icon(Icons.password),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      log('trying to change the obscure = ${loginController.isObscure.value}');
                      loginController.isObscure.value =
                      !loginController.isObscure.value;
                    },
                    child: loginController.isObscure.value
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                  ),
                  type: Constants.passwordFieldType,
                  pinObscure: loginController.isObscure.value,
                  // icon: Image.asset(AppImages.tallyLogo),
                  hintText: "Enter Password",
                  errorText: "Please enter your password",
                  width: width,
                  label: "Password",
                  height: height)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => AppCheckBox(
                            checkColor: AppColors.tallyColor,
                            isRememberMe: loginController.isRememberMe.value,
                            setIsRememberMe: loginController.setIsRememberMe)),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: AppColors.darkBackgroundColor),
                        )
                      ],
                    ),
                    // GestureDetector(
                    //     onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                    //     child: const Text(
                    //       'Forgot Your Password?',
                    //       style: TextStyle(
                    //           color: AppColors.tallyColor,
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w700),
                    //     )),
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppButton(
                  buttonHeight: 50,
                  pressedFunction: () => loginController.submit(context),
                  buttonColor: AppColors.tallyColor,
                  buttonText: 'Log into Account',
                  buttonRadius: 10,
                  textColor:
                  (loginController.usernameController.text.isNotEmpty &&
                      loginController.passwordController.text.isNotEmpty)
                      ? AppColors.lightBackgroundColor
                      : AppColors.darkBackgroundColor,
                ),
              ),
              SizedBox(
                height: height * .025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
