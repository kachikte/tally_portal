import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class WithdrawFundsScreen extends StatefulWidget {
  @override
  State<WithdrawFundsScreen> createState() => _WithdrawFundsScreenState();
}

class _WithdrawFundsScreenState extends State<WithdrawFundsScreen> {
  TextEditingController amountController = TextEditingController();

  TextEditingController accountNumberController = TextEditingController();

  TextEditingController bankController = TextEditingController();

  TextEditingController accountNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackgroundColor,
        leading: const BackButton(
          color: AppColors.darkBackgroundColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Withdraw Funds",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              height: height * .025,
            ),
            AppInput(
                textEditingController: amountController,
                hintText: "Amount",
                errorText: "Please enter Amount",
                width: width,
                label: "",
                height: height),
            AppInput(
                textInputType: TextInputType.number,
                textEditingController: accountNumberController,
                hintText: "Account Number",
                errorText: "Please enter account number",
                width: width,
                label: "",
                height: height),
            AppInput(
                textEditingController: bankController,
                hintText: "Select Bank",
                errorText: "Please Select Bank",
                suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                width: width,
                label: "",
                height: height),
            AppInput(
                textEditingController: accountNameController,
                hintText: "Account Name",
                errorText: "Please enter account name",
                width: width,
                label: "",
                height: height),
            SizedBox(
              height: height * .025,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                  buttonRadius: 10,
                  pressedFunction: () =>
                      Get.toNamed(AppRoutes.status, arguments: {
                        'text': 'Withdrawal Successful',
                        'subText': 'Your withdrawal of ₦5000 was successful',
                        'function': AppRoutes.manageCards,
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
                                backgroundColor: AppColors.lightBackgroundColor,
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
                      }),
                  buttonColor: AppColors.tallyColor,
                  buttonText: 'Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
