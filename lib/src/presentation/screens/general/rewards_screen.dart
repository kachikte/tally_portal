import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class RewardsScreen extends StatefulWidget {
  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController promoController = TextEditingController();

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.lightBackgroundColor,
        appBar: AppBar(
          leading: const BackButton(
            color: AppColors.darkBackgroundColor,
          ),
          elevation: 0,
          backgroundColor: AppColors.lightBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.giftPixPng),
                SizedBox(
                  height: height * .05,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Earn Rewards!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Container(
                  width: width * .8,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Enjoy ₦500 off your next ride when you invite a friend. your friend gets ₦500 off their first ride too!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Container(
                  width: width * .6,
                  height: height * .07,
                  decoration: BoxDecoration(
                      color: AppColors.tallyColor.withOpacity(.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('TR-MAR456CT'),
                      Icon(
                        Icons.copy_outlined,
                        color: AppColors.tallyColor,
                      ),
                      VerticalDivider(
                        width: 2,
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Icon(
                        Icons.share_outlined,
                        color: AppColors.tallyColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .07,
                ),
                AppInput(
                  textEditingController: promoController,
                  hintText: 'Enter Promo Code',
                  errorText: '',
                  width: width,
                  label: 'Promo Code',
                  height: height,
                  fillColor: AppColors.lightGrey,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: width,
                  child: Text(
                    'promo will be applied on next ride',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkBackgroundColor.withOpacity(.5)),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                AppButton(
                    buttonRadius: 10,
                    pressedFunction: () => Get.back(),
                    buttonColor: AppColors.tallyColor,
                    buttonText: 'Apply'),
              ],
            ),
          ),
        ));
  }
}
