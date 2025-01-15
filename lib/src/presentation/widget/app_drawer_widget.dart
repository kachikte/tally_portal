// import 'package:flutter/material.dart';
// import 'package:shelter/config/config.dart';
//
// class AppDrawerWidget extends StatelessWidget {
//   const AppDrawerWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           // User Info at the top of the drawer
//           UserAccountsDrawerHeader(
//             accountName: Text(
//               'John Doe',
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//             ),
//             accountEmail: Text(
//               'johndoe@email.com',
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium
//                   ?.copyWith(color: Colors.white),
//             ),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: AppColors.appWhite,
//               child: Text(
//                 'JD',
//                 style: TextStyle(fontSize: 40.0, color: AppColors.primaryColor),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: AppColors.primaryColor,
//             ),
//           ),
//
//           // Drawer items
//           ListTile(
//             leading: Icon(Icons.home, color: AppColors.primaryColor),
//             title: Text('Home'),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.account_circle, color: AppColors.primaryColor),
//             title: Text('Profile'),
//             onTap: () {
//               // Navigate to profile screen
//               Navigator.of(context).pop();
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings, color: AppColors.primaryColor),
//             title: Text('Settings'),
//             onTap: () {
//               // Navigate to settings screen
//               Navigator.of(context).pop();
//             },
//           ),
//           const Divider(),
//
//           // Log out option
//           ListTile(
//             leading: Icon(Icons.logout, color: AppColors.primaryColor),
//             title: Text('Log Out'),
//             onTap: () {
//               // Log out functionality
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/presentation.dart';
import 'package:tally_portal/src/utils/utils.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();

    GeneralController generalController = Get.find();
    Size size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: AppColors.lightBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: size.height * .3,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: AppColors.tallyColor),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .17,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.profile),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.darkBackgroundColor,
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(28)),
                          child: Image.network(
                            profileController.appUserModel.imageUrl
                                .value, // Replace with your actual image URL
                            width: 45,
                            height: 45,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 45,
                              ); // Show an error icon if the image fails to load
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicator(); // Show a loading spinner while the image is loading
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${profileController.appUserModel.lastName.value} ${profileController.appUserModel.firstName.value}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.lightBackgroundColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '4.8',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Text(
                            'My Profile',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppDrawerRowWidget(
              image: AppImages.securityUserPng,
              name: Constants.dashboard,
              route: AppRoutes.dashboard,
              isActive:
              generalController.selected.value == Constants.dashboard),
          AppDrawerRowWidget(
              image: AppImages.walletBoldPng,
              name: Constants.request,
              route: AppRoutes.payment,
              isActive:
              generalController.selected.value == Constants.request),
          AppDrawerRowWidget(
              image: AppImages.ridePng,
              name: Constants.passengers,
              route: AppRoutes.tripHome,
              isActive: generalController.selected.value == Constants.passengers),

          AppDrawerRowWidget(
              image: AppImages.giftPng,
              name: Constants.drivers,
              route: AppRoutes.reward,
              isActive:
              generalController.selected.value == Constants.drivers),
          AppDrawerRowWidget(
              image: AppImages.securityUserPng,
              name: Constants.rides,
              route: AppRoutes.support,
              isActive: generalController.selected.value == Constants.rides),
          AppDrawerRowWidget(
              image: AppImages.notificationPng,
              name: Constants.notifications,
              route: AppRoutes.notification,
              isActive:
              generalController.selected.value == Constants.notifications),
          AppDrawerRowWidget(
              image: AppImages.historyPng,
              name: Constants.settings,
              route: AppRoutes.legal,
              isActive: generalController.selected.value == Constants.settings),
        ],
      ),
    );
  }
}
