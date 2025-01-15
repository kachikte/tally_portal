import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally_portal/src/config/config.dart';
import 'package:tally_portal/src/presentation/presentation.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TripController tripController = Get.find();
  TextEditingController chatController = TextEditingController();

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
        backgroundColor: AppColors.tallyColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.lightBackgroundColor,
      body: Stack(
        children: [
          SizedBox(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    width: size.width,
                    decoration:
                        const BoxDecoration(color: AppColors.tallyColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Adeyemi',
                          style:
                              Theme.of(context).textTheme.headlineLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return chatWidget(
                            height: size.height,
                            width: size.width,
                            isMe: index.isEven ? false : true,
                            chat: index.isEven
                                ? 'Good Evening!'
                                : 'What is the nearest landmark to your house?',
                            time: '8:29 pm');
                      },
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(5),
              height: size.height * .13,
              width: size.width,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          style: BorderStyle.solid,
                          width: 1,
                          color: AppColors.lightGrey))),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * .85,
                    child: AppInput(
                        textEditingController: chatController,
                        hintText: 'Type message here',
                        errorText: '',
                        width: size.width,
                        label: '',
                        height: size.height),
                  ),
                  IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.tripHome),
                      icon: const Icon(
                        Icons.send_rounded,
                        color: AppColors.tallyColor,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  chatWidget(
      {required double width,
      required double height,
      required bool isMe,
      required String chat,
      required String time}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(15),
                    topLeft: isMe ? const Radius.circular(15) : Radius.zero,
                    bottomRight: isMe ? Radius.zero : const Radius.circular(15),
                    bottomLeft: const Radius.circular(15)),
                color: isMe
                    ? AppColors.tallyColor
                    : AppColors.lightGrey.withOpacity(.5)),
            child: Text(
              chat,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            time,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
