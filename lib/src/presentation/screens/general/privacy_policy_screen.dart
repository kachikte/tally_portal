import 'package:flutter/material.dart';
import 'package:tally_portal/src/config/config.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen();

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
                    'Privacy Policy',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                SizedBox(
                  width: size.width,
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur. Eget nisi ut senectus auctor mi nec at. Leo sapien tincidunt imperdiet dignissim scelerisque purus nec. Feugiat dui in lacus egestas venenatis. Sed felis dapibus sem consequat sit sagittis gravida nisi. Enim eu neque vestibulum posuere ut dignissim. Ridiculus sed at elementum egestas enim posuere donec interdum. Erat arcu potenti gravida integer nunc purus nisi pharetra rhoncus. Volutpat neque elit egestas faucibus dictum at mattis nunc neque. Facilisis dictum augue diam cras. Dui massa orci gravida nullam facilisis magnis tellus in. Ipsum proin vitae eget sollicitudin velit. In interdum tincidunt et amet. Lorem ipsum dolor sit amet consectetur. Eget nisi ut senectus auctor mi nec at. Leo sapien tincidunt imperdiet dignissim scelerisque purus nec. Feugiat dui in lacus egestas venenatis. Sed felis dapibus sem consequat sit sagittis gravida nisi. Enim eu neque vestibulum posuere ut dignissim. Ridiculus sed at elementum egestas enim posuere donec interdum. Erat arcu potenti gravida integer nunc purus nisi pharetra rhoncus. Volutpat neque elit egestas faucibus dictum at mattis nunc neque. Facilisis dictum augue diam cras. Dui massa orci gravida nullam facilisis magnis tellus in. Ipsum proin vitae eget sollicitudin velit. In interdum tincidunt et amet.',
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 30,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
