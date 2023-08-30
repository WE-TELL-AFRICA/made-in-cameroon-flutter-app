import 'package:flutter/material.dart';

import '../../utils/appColor.dart';
import '../../utils/dimens.dart';


class ButtonIcon extends StatefulWidget {
  ButtonIcon({
    Key? key,
    required this.onClick,
    required  this.iconData,
  }) : super(key: key);

  Function onClick;
  IconData iconData;

  @override
  State<StatefulWidget> createState() => _ButtonIcon();
}

class _ButtonIcon extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorPrimary,
      ),
      child:  IconButton(
        onPressed: (){
          widget.onClick();
        },
        icon: Icon(widget.iconData, color: Colors.white, size: smallSizeIcon,),
      ),
    );
  }
}
