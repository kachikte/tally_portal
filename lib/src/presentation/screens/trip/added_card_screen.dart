import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/app_colors.dart';
import 'package:tally_portal/src/config/app_images.dart';
import 'package:tally_portal/src/config/app_routes.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class AddedCardScreen extends StatefulWidget {
  @override
  _AddedCardScreenState createState() => _AddedCardScreenState();
}

class _AddedCardScreenState extends State<AddedCardScreen> {
  String selectedPaymentMethod = '';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Ride',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Expanded(child: SizedBox()),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.tallyColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(
                    size: 16,
                    Icons.edit,
                    color: AppColors.tallyColor,
                  )
                ],
              ),

              const Text('View your trip summary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),

              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.circle_outlined,
                    color: AppColors.tallyColor,
                    size: 25,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'No. 5, 85th Street',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded,
                      color: AppColors.tallyColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Vintage Hub, 135 Adetokunbo Ademola Crescent, Abuja',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  const Icon(Icons.calendar_today, color: AppColors.tallyColor),
                  const SizedBox(width: 8),
                  Text(
                    'Sat 17 Feb at 3:10 PM - 3:15 PM GMT+1',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: 'Total Fare: ', // Default text style
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: '₦2500',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.tallyColor,
                      ),
                    ),
                    TextSpan(
                      text: '  (estimated)',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Divider(
                height: 3,
                color: AppColors.darkBackgroundColor.withOpacity(.1),
                thickness: 5,
              ),
              const SizedBox(height: 24),

              // Payment Method Section
              Text(
                'Payment Method',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                'Select a payment method for your trip',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 16),

              // Wallet Payment Option
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'wallet';
                  });
                },
                child: paymentOptionCard(
                  'My Wallet',
                  '₦5500',
                  AppImages.walletPng,
                  selectedPaymentMethod == 'wallet',
                ),
              ),
              const SizedBox(height: 8),

              // Bank Transfer Payment Option
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'bank';
                  });
                },
                child: paymentOptionCard(
                  'Bank Transfer',
                  '',
                  AppImages.bankPng,
                  selectedPaymentMethod == 'bank',
                ),
              ),
              const SizedBox(height: 8),

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

              const SizedBox(height: 35),

              // Pay Now Button
              AppButton(
                pressedFunction: selectedPaymentMethod == ''
                    ? () {}
                    : () => Get.toNamed(AppRoutes.status, arguments: {
                          'text': 'Ride Scheduled Successfully',
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
                          'function': AppRoutes.upcomingTrip
                        }),
                buttonColor: selectedPaymentMethod == ''
                    ? AppColors.lightGrey
                    : AppColors.tallyColor,
                buttonText: 'Pay Now',
                buttonRadius: 10,
              ),
              const SizedBox(height: 25),
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
