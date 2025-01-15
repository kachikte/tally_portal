import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class MyCardScreen extends StatefulWidget {
  @override
  State<MyCardScreen> createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
  TextEditingController nameController =
      TextEditingController(text: 'John Smith');

  TextEditingController cardNumberController =
      TextEditingController(text: '537 2345 3445 67890');

  TextEditingController expController = TextEditingController(text: '03/27');

  TextEditingController cvvController = TextEditingController(text: '222');

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
                "My Card",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              height: height * .025,
            ),
            AppInput(
                textEditingController: nameController,
                hintText: "Card holder’s name",
                errorText: "Please enter name",
                width: width,
                label: "",
                height: height),
            AppInput(
                textInputType: TextInputType.number,
                textEditingController: cardNumberController,
                hintText: "Card number",
                errorText: "Please enter card number",
                width: width,
                icon: const Icon(Icons.credit_card_outlined),
                label: "",
                height: height),
            Row(
              children: [
                SizedBox(
                  width: width * .5,
                  child: AppInput(
                      textEditingController: expController,
                      hintText: "Expiry Date",
                      errorText: "Please enter card Expiry Date",
                      width: width,
                      label: "",
                      height: height),
                ),
                SizedBox(
                  width: width * .5,
                  child: AppInput(
                      textEditingController: cvvController,
                      hintText: "CVV",
                      errorText: "Please enter card CVV",
                      width: width,
                      label: "",
                      height: height),
                ),
              ],
            ),
            SizedBox(
              height: height * .4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppButton(
                buttonHeight: 50,
                pressedFunction: () => Get.toNamed(AppRoutes.tripHome),
                buttonColor: AppColors.appRed,
                buttonText: 'Remove Card',
                buttonRadius: 10,
                textColor: AppColors.lightBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
