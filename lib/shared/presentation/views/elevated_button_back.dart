import 'package:flutter/material.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';

class ElevatedButtonBack extends StatelessWidget {
  ElevatedButtonBack(
      {super.key, this.onPressed, this.sizeIcon = 18.0, this.color, this.text});

  Function? onPressed;
  double? sizeIcon;
  Color? color;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed ?? (Navigator.pop(context));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(0, 1)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: color ?? Colors.black,
                size: sizeIcon,
              ),
              Text(
                "$text",
                style: TextStyle(color: Colors.black, fontSize: smallTextSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
