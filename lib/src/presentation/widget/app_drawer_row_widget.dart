import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/controllers/controllers.dart';

class AppDrawerRowWidget extends StatelessWidget {
  final String image;
  final String name;
  final String route;
  final bool isActive;

  const AppDrawerRowWidget(
      {required this.image,
      required this.name,
      required this.route,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.find();

    return GestureDetector(
      onTap: () {
        generalController.selected = name.obs;
        Get.toNamed(route);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: (isActive
                    ? AppColors.lightBackgroundColor
                    : AppColors.darkBackgroundColor)
                .withOpacity(.1),
            border: Border.all(
                color: isActive
                    ? AppColors.lightBackgroundColor
                    : AppColors.darkBackgroundColor,
                width: 1,
                style: BorderStyle.none),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Image.asset(image),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.lightBackgroundColor),
            )
          ],
        ),
      ),
    );
  }
}
