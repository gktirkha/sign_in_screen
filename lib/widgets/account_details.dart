import 'package:flutter/material.dart';

import '../strings.dart';

class AccountDetailsTile extends StatelessWidget {
  const AccountDetailsTile({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.green, width: 2)),
          child: Icon(
            Icons.person,
            size: mediaQueryData.size.height * .07,
          ),
        ),
        SizedBox(
          width: mediaQueryData.size.width * .01,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StaticStrings.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[900],
              ),
            ),
            Row(
              children: [
                Text(StaticStrings.cityName),
                Icon(
                  Icons.location_on,
                  color: Colors.green[400],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
