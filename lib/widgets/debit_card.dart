import 'package:flutter/material.dart';

import '../strings.dart';
import 'common.dart';

class DebitCard extends StatelessWidget {
  const DebitCard({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [Colors.green[600]!, Colors.green[600]!],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(.1)),
                child: Text(
                  "Card",
                  style: subtitleText(mediaQueryData),
                ),
              ),
            ],
          ),
          Text(
            "xxxxxxxxxxxx",
            style: TextStyle(
              fontSize: mediaQueryData.textScaleFactor * 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          VSizedBox(mediaQueryData: mediaQueryData),
          Text("Card Number", style: subtitleText(mediaQueryData)),
          VSizedBox(mediaQueryData: mediaQueryData),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StaticStrings.userName,
                    style: subtitleText(mediaQueryData),
                  ),
                  Text(
                    "Name",
                    style: subtitleTextSmall(mediaQueryData),
                  )
                ],
              ),
              HSizedBox(mediaQueryData: mediaQueryData),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "02/02/2200",
                    style: subtitleText(mediaQueryData),
                  ),
                  Text(
                    "Valid",
                    style: subtitleTextSmall(mediaQueryData),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
