import 'package:flutter/material.dart';

import '../strings.dart';
import '../widgets/account_details.dart';
import '../widgets/common.dart';
import '../widgets/debit_card.dart';

class AccountFragment extends StatelessWidget {
  const AccountFragment({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountDetailsTile(mediaQueryData: mediaQueryData),
          VSizedBox(mediaQueryData: mediaQueryData),
          Row(
            children: [
              const Text("Balance"),
              HSizedBox(mediaQueryData: mediaQueryData),
              Text(
                StaticStrings.accBalance,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          VSizedBox(mediaQueryData: mediaQueryData),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleIcon(iconData: Icons.add, mediaQueryData: mediaQueryData),
              HSizedBox(mediaQueryData: mediaQueryData),
              CircleIcon(
                  iconData: Icons.search, mediaQueryData: mediaQueryData),
              HSizedBox(mediaQueryData: mediaQueryData),
              CircleIcon(
                  iconData: Icons.bar_chart, mediaQueryData: mediaQueryData),
              HSizedBox(mediaQueryData: mediaQueryData),
            ],
          ),
          VSizedBox(mediaQueryData: mediaQueryData),
          DebitCard(mediaQueryData: mediaQueryData),
          VSizedBox(mediaQueryData: mediaQueryData),
          const CustomTile(text: "MyCard"),
          VSizedBox(mediaQueryData: mediaQueryData),
          const CustomTile(text: "Transactions")
        ],
      ),
    );
  }
}
