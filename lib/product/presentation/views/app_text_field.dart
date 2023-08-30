import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.label,
    this.textController,
    required this.hintText,
    this.withLabel = true,
    this.textInputType = TextInputType.text,
    this.maxLine = 1,
    this.isLarge = false,
    this.isObscure = false,
    this.fontSize = defaultTextSize,
    this.isRequired = true,
  }) : super(key: key);

  final TextEditingController? textController;
  final String hintText;
  final TextInputType? textInputType;
  final int maxLine;
  final bool isObscure;
  final bool isLarge;
  final bool isRequired;
  final String label;
  final bool withLabel;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (withLabel)
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                    color: colorText,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400),
                ),
            ],
          ),
        Container(
          height: (maxLine < 2) ? 50 : 100,
          margin: EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            keyboardType: textInputType,
            obscureText: isObscure,
            maxLines: maxLine,
            style: TextStyle(fontSize: fontSize),
            controller: textController,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colorGreyLight)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colorGreyLight)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colorGreyLight)),
            ),
          ),
        ),
      ],
    );
  }
}
