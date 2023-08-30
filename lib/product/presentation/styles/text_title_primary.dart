import 'package:flutter/material.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';
import '../../../shared/utils/appColor.dart';

class TextTitlePrimary extends StatelessWidget {
  TextTitlePrimary({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: const TextStyle(
          color: colorPrimary,
          fontWeight: FontWeight.w500,
          fontSize: defaultTextSize),
    );
  }
}
