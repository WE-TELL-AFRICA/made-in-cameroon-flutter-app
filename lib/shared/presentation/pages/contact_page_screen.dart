import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';

import '../views/app_bar_main.dart';

class ContactPageScreen extends StatelessWidget {
  const ContactPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarMain(
              title: "Contact",
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact",
                    style: TextStyle(
                        color: colorSecondary,
                        fontSize: defaultTextSize,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    """Nous restons à votre disposition pour toutes vos questions ou tout autre type de besoin. Rendez dans nos locaux ou via l’un des moyens de contact ci-dessous:\nAddresse : Ndogbati, Bassa, Douala\nhello@madein-cameroon.cm\n+237 243 000 000""",
                    style: TextStyle(
                      color: colorText,
                      fontSize: defaultTextSize,
                      letterSpacing: 1.2
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
