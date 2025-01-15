import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/app_colors.dart';
import 'package:tally_portal/src/config/app_images.dart';
import 'package:tally_portal/src/config/app_routes.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class ManageCardsScreen extends StatefulWidget {
  @override
  _ManageCardsScreenState createState() => _ManageCardsScreenState();
}

class _ManageCardsScreenState extends State<ManageCardsScreen> {
  String selectedPaymentMethod = 'wallet';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.darkBackgroundColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.lightBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          // height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ride Summary Section
              Text(
                'Manage Cards',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 35),

              // Bank Transfer Payment Option
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'card';
                  });
                },
                child: paymentOptionCard(
                  '**** **** **** 8970',
                  'Expires: 12/26',
                  AppImages.mastercardPng,
                  selectedPaymentMethod == 'card',
                ),
              ),
              const SizedBox(height: 20),

              // Add Card Payment Option
              SizedBox(
                height: 55,
                child: AppButton(
                  pressedFunction: () =>
                      Get.toNamed(AppRoutes.addCard, arguments: {
                    'isTrip': 'false',
                  }),
                  buttonColor: AppColors.tallyColor.withOpacity(.1),
                  buttonText: 'Add New Card',
                  buttonRadius: 10,
                  buttonIcon: const Icon(
                    Icons.add,
                    color: AppColors.darkBackgroundColor,
                  ),
                  borderColor: AppColors.tallyColor,
                ),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentOptionCard(
    String title,
    String subtitle,
    String image,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? AppColors.tallyColor : AppColors.lightGrey,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        subtitle: subtitle.isNotEmpty
            ? Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.darkBackgroundColor),
              )
            : null,
      ),
    );
  }
}
