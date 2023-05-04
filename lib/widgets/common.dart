import 'package:flutter/material.dart';

class VSizedBox extends StatelessWidget {
  const VSizedBox({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: mediaQueryData.size.height * .03);
  }
}

class HSizedBox extends StatelessWidget {
  const HSizedBox({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: mediaQueryData.size.width * .04);
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon(
      {super.key, required this.iconData, required this.mediaQueryData});
  final IconData iconData;
  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mediaQueryData.size.width * .005),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey, width: 2)),
      child: Icon(
        iconData,
        size: mediaQueryData.size.height * .04,
        color: Colors.deepPurple,
      ),
    );
  }
}

TextStyle subtitleText(MediaQueryData mediaQueryData) {
  return TextStyle(
    fontSize: mediaQueryData.textScaleFactor * 16,
    color: Colors.white,
  );
}

TextStyle subtitleTextSmall(MediaQueryData mediaQueryData) {
  return TextStyle(
    fontSize: mediaQueryData.textScaleFactor * 12,
    color: Colors.white,
  );
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
