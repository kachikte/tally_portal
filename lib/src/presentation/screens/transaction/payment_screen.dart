import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isSet = false;

  TextEditingController reasonController = TextEditingController();

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
              Text(
                'My Payments',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                height: size.height * .15,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.walletBackgroundPng),
                      fit: BoxFit.cover, // Adjust the fit to your preference
                    ),
                    color: AppColors.darkBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet Balance',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.lightBackgroundColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '₦20,500.00',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColors.lightBackgroundColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: button(
                        route: AppRoutes.payment,
                        image: AppImages.fundWalletPng,
                        name: 'Fund Wallet'),
                  ),
                  Expanded(
                    child: button(
                        route: AppRoutes.withdrawFunds,
                        image: AppImages.pathPng,
                        name: 'Withdraw Funds'),
                  )
                ],
              ),
              buttonNext(
                  route: AppRoutes.payment, name: 'Manage Cards', size: size),
              const SizedBox(height: 20),
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionHistoryRow(
                    amount: '₦3,500.00',
                    size: size,
                    isDebit: false,
                    date: 'Jan 10,2024',
                    text:
                        'Vintage Hub, 135 Adetokunbo Ademola  Crescent, Abuja'),
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionHistoryRow(
                    amount: '₦3,500.00',
                    size: size,
                    isDebit: true,
                    date: 'Jan 10,2024',
                    text:
                        'Vintage Hub, 135 Adetokunbo Ademola  Crescent, Abuja'),
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionHistoryRow(
                    amount: '₦3,500.00',
                    size: size,
                    isDebit: false,
                    date: 'Jan 10,2024',
                    text:
                        'Vintage Hub, 135 Adetokunbo Ademola  Crescent, Abuja'),
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionHistoryRow(
                    amount: '₦3,500.00',
                    size: size,
                    isDebit: true,
                    date: 'Jan 10,2024',
                    text:
                        'Vintage Hub, 135 Adetokunbo Ademola  Crescent, Abuja'),
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionHistoryRow(
                    amount: '₦3,500.00',
                    size: size,
                    isDebit: false,
                    date: 'Jan 10,2024',
                    text:
                        'Vintage Hub, 135 Adetokunbo Ademola  Crescent, Abuja'),
              ),
              GestureDetector(
                onTap: () {},
                child: TransactionHistoryRow(
                    amount: '₦3,500.00',
                    size: size,
                    isDebit: true,
                    date: 'Jan 10,2024',
                    text:
                        'Vintage Hub, 135 Adetokunbo Ademola  Crescent, Abuja'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(
      {required String route, required String image, required String name}) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
        decoration: BoxDecoration(
            color: AppColors.tallyColor,
            border: Border.all(
                color: AppColors.tallyColor,
                width: 1,
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }

  Widget buttonNext(
      {required Size size, required String route, required String name}) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
        decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(.5),
            border: Border.all(
                color: AppColors.lightGrey.withOpacity(.5),
                width: 1,
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
