import 'package:flutter/material.dart';

import '../../../shared/utils/dimens.dart';

class TextlabelForm extends Text {
  TextlabelForm(
    String data, {
    required this.color,
  }) : super(data, style: TextStyle(color: color,  fontSize: defaultTextSize, fontWeight: FontWeight.bold));

  Color color;
}
