import 'package:flutter/material.dart';

import '../../../shared/utils/appColor.dart';
import '../styles/space8.dart';

class FormTitleLogo extends StatelessWidget{

  FormTitleLogo({
    Key? key,
    required this.titre,
  }) : super(key: key);

  String titre;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80*1.5,
          child: ClipRRect(
            borderRadius:
            BorderRadius.all(Radius.circular(15)),
            child: Image.asset(
              "assets/images/logo.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Space8(),
        Text(
          titre,
          style: TextStyle(
              color: colorText,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],

    );


  }


}



