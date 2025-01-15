import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/presentation/controllers/support_controller.dart';
import 'package:tally_portal/src/presentation/presentation.dart';
import 'package:tally_portal/src/utils/util_functions.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen();

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  SupportController supportController = Get.find();
  ProfileController profileController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.lightBackgroundColor,
          leading: const BackButton(
            color: AppColors.darkBackgroundColor,
          ),
          elevation: 0,
        ),
        backgroundColor: AppColors.lightBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Contact Support',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                AppInput(
                    textEditingController: supportController.titleController,
                    hintText: "Subject",
                    errorText: "",
                    width: width,
                    label: "",
                    height: height),
                AppArea(
                    textEditingController:
                        supportController.descriptionController,
                    fillColor: AppColors.lightGrey.withOpacity(.5),
                    hintText: 'input your concerns',
                    errorText: '',
                    width: width,
                    label: const SizedBox(),
                    height: height),
                SizedBox(
                  height: height * .1,
                ),
                AppButton(
                    buttonRadius: 10,
                    pressedFunction: () async {
                      if (supportController.titleController.text.isEmpty ||
                          supportController
                              .descriptionController.text.isEmpty) {
                        UtilFunctions.showTopSnackError(
                            context, 'Missing Fields');
                        return;
                      }

                      UtilFunctions.showOverLay(context);

                      ResponseModel responseModel = await supportController
                          .submitSupport(profileController: profileController);

                      if (context.mounted) {
                        UtilFunctions.hideOverLay(context);
                      }
                      if (responseModel.isError) {
                        if (context.mounted) {
                          UtilFunctions.showTopSnackError(
                              context, responseModel.data);
                          return;
                        }
                      } else {
                        if (context.mounted) {
                          UtilFunctions.showTopSnackSuccess(
                              context, 'Created Successfully');
                          Get.toNamed(AppRoutes.status, arguments: {
                            'text': 'Message Sent',
                            'remv': true,
                            'subText':
                                'Your message has been sent and will be reviewed by the admin',
                            'buttonText': 'Back Home',
                            'function': AppRoutes.dashboard,
                            'icon': const CircleAvatar(
                              radius: 62,
                              backgroundColor: AppColors.appGreen,
                              child: CircleAvatar(
                                radius: 61,
                                backgroundColor: AppColors.lightBackgroundColor,
                                child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: AppColors.appGreen,
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor:
                                        AppColors.lightBackgroundColor,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: AppColors.appGreen,
                                      child: Icon(
                                        Icons.check,
                                        size: 50,
                                        color: AppColors.lightBackgroundColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          });
                        }
                      }
                    },
                    buttonColor: AppColors.tallyColor,
                    buttonText: 'Submit'),
                SizedBox(
                  height: height * .3,
                ),
              ],
            ),
          ),
        ));
  }
}
