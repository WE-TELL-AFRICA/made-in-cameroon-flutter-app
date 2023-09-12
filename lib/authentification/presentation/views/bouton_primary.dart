import 'package:flutter/material.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';


class BoutonPrimary extends StatefulWidget {
  BoutonPrimary({
    Key? key,
    required this.titre,
    required this.onClick,
    IconData? this.iconData,
  }) : super(key: key);

  Function onClick;
  String titre;
  IconData? iconData;

  @override
  State<StatefulWidget> createState() => _BoutonPrimary();
}

class _BoutonPrimary extends State<BoutonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ElevatedButton(
        onPressed: () { widget.onClick(); },

        style: ElevatedButton.styleFrom( primary: colorPrimary, elevation: 4, padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10),
          ),
        ),

        child: Row( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        widget.iconData == null ?
        Padding(padding: EdgeInsets.all(0.0))
            :
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Icon(widget.iconData, color: Colors.white, size: smallSizeIcon,),
        ),

        Text(
          widget.titre,
          style: TextStyle(
            color: Colors.white,
            fontSize: defaultTextSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
      ),
      )

    );
  }
}
