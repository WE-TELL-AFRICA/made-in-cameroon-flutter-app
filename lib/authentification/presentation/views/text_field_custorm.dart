import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madeincameroon/authentification/presentation/views/text_label_form.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';

class TextFieldCustorm extends StatelessWidget {
  TextFieldCustorm(
      {Key? key,
        required this.hintText,
        required this.icon,
        required this.textEditingController})
      : super(key: key);

  String hintText;
  IconData icon;
  TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextlabelForm(hintText, color: colorText),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2, offset: Offset(0, 1)),
              ]),
          child: TextField(
            controller: textEditingController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black, fontSize: defaultTextSize),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  icon,
                  size: smallSizeIcon,
                  color: colorPrimary,
                ),
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}