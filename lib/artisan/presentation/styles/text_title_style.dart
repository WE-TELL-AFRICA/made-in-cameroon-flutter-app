import 'package:flutter/material.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';
import '../../../shared/utils/appColor.dart';


class TextTitle extends StatelessWidget {
    TextTitle({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(color: colorText, fontWeight: FontWeight.bold, fontSize: defaultTextSize),);
  }
}
