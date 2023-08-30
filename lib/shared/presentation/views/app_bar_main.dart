import 'package:flutter/material.dart';
import 'icon_button_back.dart';
import '../../utils/appColor.dart';

class AppBarMain extends StatelessWidget {

  AppBarMain({super.key,  required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        color: colorPrimary,
        child: Row(
          children: [
            IconButtonBack(),
            SizedBox(width: 16.0,),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
  }
}
