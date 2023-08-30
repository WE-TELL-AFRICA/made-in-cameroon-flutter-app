import 'package:flutter/material.dart';

class IconButtonBack extends StatelessWidget {

  IconButtonBack({super.key, this.onPressed, this.sizeIcon = 24.0, this.color });

  Function? onPressed;
  double? sizeIcon;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_rounded,
        color: color ?? Colors.white,
        size: sizeIcon,
      ),
      onPressed: () {
        onPressed ?? (Navigator.pop(context));
      },
    );
  }
}
