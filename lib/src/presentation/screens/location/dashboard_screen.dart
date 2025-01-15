import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/data/data.dart';
import 'package:tally_portal/src/domain/domain.dart';
import 'package:tally_portal/src/domain/models/user_profile_model.dart';
import 'package:tally_portal/src/presentation/presentation.dart';
import 'package:dio/dio.dart' as dio;
import 'package:tally_portal/src/utils/utils.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController locationController = TextEditingController();
  GeneralController generalController = Get.find();
  TripController tripController = Get.find();
  ProfileController profileController = Get.find();
  Location location = Location();
  late GoogleMapController mapController;

  @override
  void initState() {
    initProf();
    super.initState();
  }

  initProf() async {
    String? token = await SharedPrefStorage.getToken();
    ResponseModel responseModelProfile = await profileController.getProfile(
        authorization: "Bearer", accessToken: token!);

    log("Rntering herre profile details === ${responseModelProfile.data}");
    UserProfileModel userProfileModel =
        responseModelProfile.data as UserProfileModel;
    profileController.setProfileValues(
        userProfileModel: userProfileModel, uniqueKey: "");
    profileController.getProfileValues();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: Container(
          width: width,
          height: height,
          // decoration: const BoxDecoration(
          //   color: AppColors.tallyColor
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration:
                    const BoxDecoration(color: AppColors.darkBackgroundColor),
                width: width * .18,
                child: Column(
                  // padding: EdgeInsets.zero,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height * .03,
                    ),
                    Image.asset(
                      AppImages.tallyLogoPng,
                      color: AppColors.lightBackgroundColor,
                      width: width * .3,
                      height: height * .05,
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    AppDrawerRowWidget(
                        image: AppImages.securityUserPng,
                        name: Constants.dashboard,
                        route: AppRoutes.dashboard,
                        isActive: generalController.selected.value ==
                            Constants.dashboard),
                    AppDrawerRowWidget(
                        image: AppImages.walletBoldPng,
                        name: Constants.request,
                        route: AppRoutes.payment,
                        isActive: generalController.selected.value ==
                            Constants.request),
                    AppDrawerRowWidget(
                        image: AppImages.ridePng,
                        name: Constants.passengers,
                        route: AppRoutes.tripHome,
                        isActive: generalController.selected.value ==
                            Constants.passengers),
                    AppDrawerRowWidget(
                        image: AppImages.giftPng,
                        name: Constants.drivers,
                        route: AppRoutes.reward,
                        isActive: generalController.selected.value ==
                            Constants.drivers),
                    AppDrawerRowWidget(
                        image: AppImages.securityUserPng,
                        name: Constants.rides,
                        route: AppRoutes.support,
                        isActive: generalController.selected.value ==
                            Constants.rides),
                    AppDrawerRowWidget(
                        image: AppImages.notificationPng,
                        name: Constants.notifications,
                        route: AppRoutes.notification,
                        isActive: generalController.selected.value ==
                            Constants.notifications),
                    AppDrawerRowWidget(
                        image: AppImages.historyPng,
                        name: Constants.settings,
                        route: AppRoutes.legal,
                        isActive: generalController.selected.value ==
                            Constants.settings),
                    SizedBox(
                      height: height * .1,
                    ),
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 1,
                      height: 2,
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    GestureDetector(
                      onTap: () async {
                        UtilFunctions.showOverLay(context);
                        bool res = await profileController.logout(
                            isRememberMe:
                                profileController.getRememberMeValue());
                        UtilFunctions.hideOverLay(context);
                        if (res) {
                          Get.offAndToNamed(AppRoutes.login);
                        } else {
                          return;
                        }
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            size: 20,
                            Icons.logout,
                            color: AppColors.lightBackgroundColor,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Log Out',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.lightBackgroundColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * .82,
                child: Column(
                  children: [
                    Container(
                      height: height * .08,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: AppColors.lightBackgroundColor),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Dashboard',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: width * .5,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.profile),
                            child: const CircleAvatar(
                              radius: 23,
                              backgroundColor: AppColors.darkBackgroundColor,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: AppColors.lightBackgroundColor,
                                child: Icon(Icons.notifications),
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            width: 1,
                            color: AppColors.darkBackgroundColor,
                            indent: 10,
                            endIndent: 10,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.profile),
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: AppColors.darkBackgroundColor,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(28)),
                                child: Image.network(
                                  // '',
                                  profileController.appUserModel.imageUrl.value,
                                  // Replace with your actual image URL
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(
                                      'A',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors
                                                  .lightBackgroundColor),
                                    ); // Show an error icon if the image fails to load
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return CircularProgressIndicator(); // Show a loading spinner while the image is loading
                                  },
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Super Admin',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              Text('Admin',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12))
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          count(size,
                              bColor: AppColors.darkBackgroundColor,
                              texColor: AppColors.lightBackgroundColor,
                              body: "N200,000,000",
                              title: "Total Revenue"),
                          count(size, body: "1,164", title: "Total Passangers"),
                          count(size, body: "264", title: "Total Drivers"),
                          count(size, body: "164", title: "Total Rides")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Container(decoration: const BoxDecoration(
                              color: AppColors.lightBackgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                            height: height * .4,
                            width: width * .3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * .07,
                                  width: width * .3,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Text(
                                    "Driver Requests",
                                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                        fontWeight: FontWeight.w700, color: AppColors.darkBackgroundColor.withOpacity(.8)),
                                  ),
                                ),
                                SizedBox(
                                  height: height * .27,
                                  width: width * .3,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return driverRequest(size);
                                      },
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          height: .5,
                                          thickness: .5,
                                          color: AppColors.darkBackgroundColor,
                                        );
                                      },
                                      itemCount: 4),
                                ),
                                Container(
                                  height: height * .05,
                                  width: width * .3,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  child: Center(
                                    child: Text(
                                      "View all Requests",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500, color: AppColors.darkBackgroundColor.withOpacity(.8)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget count(Size size,
      {required String title,
      required String body,
      Color bColor = AppColors.lightBackgroundColor,
      Color texColor = AppColors.darkBackgroundColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: bColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      width: size.width * .18,
      height: size.height * .15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w700, color: texColor.withOpacity(.5)),
          ),
          Text(
            body,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w700, color: texColor),
          )
        ],
      ),
    );
  }

  Widget driverRequest(Size size) {
    return GestureDetector(
      onTap: () {},
      child: DriverDash(
          amount: '₦3,500.00',
          size: size,
          isDebit: true,
          date: 'Jan 10,2024',
          text: 'Vintage Hub, 135 Adetokunbo Ademola  Crescent, Abuja'),
    );
  }
}
