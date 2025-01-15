import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';

class LegalScreen extends StatefulWidget {
  const LegalScreen();

  @override
  State<LegalScreen> createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    'Legal',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                buttonNext(
                    size: size,
                    route: AppRoutes.privacyPolicy,
                    name: 'Privacy Policy',
                    icon: const Icon(
                      Icons.lock,
                      color: AppColors.darkBackgroundColor,
                    )),
                buttonNext(
                    size: size,
                    route: AppRoutes.privacyPolicy,
                    name: 'Terms of Use',
                    icon: const Icon(
                      Icons.person_pin,
                      color: AppColors.darkBackgroundColor,
                    ))
              ],
            ),
          ),
        ));
  }

  Widget buttonNext(
      {required Size size,
      required String route,
      required String name,
      required Icon icon}) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
        decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(.3),
            border: Border.all(
                color: AppColors.lightGrey.withOpacity(.3),
                width: 1,
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(child: SizedBox()),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
