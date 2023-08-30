import 'package:flutter/material.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';


/**
 * Widget qui permet d'afficher un champ dans l'espace profil
 */
class FieldAccount extends StatelessWidget {
  FieldAccount({Key? key, required this.iconDataLeft, required this.value, this.iconButton})
      : super(key: key);

  String value;
  IconData iconDataLeft;
  IconButton? iconButton;
  @override
  Widget build(BuildContext context) {
    Widget widgetIconButton = Padding(padding: EdgeInsets.all(0.0));
    if(iconButton != null){
      widgetIconButton = iconButton as Widget;
    }

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: colorGreyLight)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(iconDataLeft, size: 24.0,),
            ),

            Expanded(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: defaultTextSize, color: colorText, ),
              ),
            ),
            widgetIconButton,
          ],
        ),
      ),
    );
  }

}










