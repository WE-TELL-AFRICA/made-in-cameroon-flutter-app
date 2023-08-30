import 'dart:io';

import 'package:flutter/material.dart';

import '../../../shared/utils/dimens.dart';

class ImageItemView extends StatelessWidget {
  ImageItemView({super.key, required this.fileImage, required this.onClick});

  File fileImage;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.topRight,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: FileImage(File(fileImage.path)), fit: BoxFit.cover)),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: smallSizeIcon,
          ),
        ),
      ),
    );
  }
}
