import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Delete Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                SizedBox(
                  width: size.width,
                  child: Text(
                    'Are you sure you want to delete your account? Deleting your account removes your personal information from our database. This action can not be reversed.',
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 30,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * .15,
                ),
                SizedBox(
                  height: 50,
                  child: AppButton(
                      buttonRadius: 10,
                      pressedFunction: () =>
                          Get.toNamed(AppRoutes.status, arguments: {
                            'text': 'Processing',
                            'subText':
                                'Your account will be deleted within 20 days. This action can’t be reversed',
                            'icon': Image.asset(AppImages.tallyCryingPng),
                            'buttonText': 'Done',
                            'function': AppRoutes.profile
                          }),
                      textColor: AppColors.lightBackgroundColor,
                      buttonColor: AppColors.appRed,
                      buttonText: 'Delete Account'),
                )
              ],
            ),
          ),
        ));
  }
}
