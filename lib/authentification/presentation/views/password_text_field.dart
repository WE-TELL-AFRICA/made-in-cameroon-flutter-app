import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madeincameroon/authentification/presentation/views/text_label_form.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    required this.hintText,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  String hintText;
  TextEditingController textEditingController;

  @override
  State<StatefulWidget> createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextlabelForm(widget.hintText, color: colorText),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2, offset: Offset(0, 1)),
              ]),
          height: 50,
          child: TextField(
            controller: widget.textEditingController,
            obscureText: _obscureText,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: Colors.black, fontSize: defaultTextSize),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                    size: smallSizeIcon,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText =
                      !_obscureText; // inverse l'état du mode caché du mot de passe.
                    });
                  },
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: colorPrimary,
                  size: smallSizeIcon,
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        )
      ],
    );
  }
}
