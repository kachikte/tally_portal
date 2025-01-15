import 'package:flutter/material.dart';
import 'package:tally_portal/src/config/config.dart';

class TransactionHistoryRow extends StatelessWidget {
  final Size size;
  final bool isDebit;
  final String date;
  final String text;
  final String amount;

  const TransactionHistoryRow(
      {required this.size,
      required this.isDebit,
      required this.date,
      required this.amount,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      // height: size.height * .11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: (isDebit ? AppColors.appRed : AppColors.appGreen)
                .withOpacity(.2),
            child: isDebit
                ? Image.asset(AppImages.redArrowPng)
                : Image.asset(AppImages.greenArrowPng),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * .5,
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 15,
                      color: AppColors.darkBackgroundColor.withOpacity(.7)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    color: AppColors.darkBackgroundColor.withOpacity(.5)),
              )
            ],
          ),
          Column(
            children: [
              Text(
                amount,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    color: AppColors.darkBackgroundColor.withOpacity(.7)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
