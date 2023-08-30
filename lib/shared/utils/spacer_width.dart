import 'package:flutter/material.dart';


class SpacerWidth extends StatelessWidget {
  SpacerWidth({super.key, this.width = 8.0});

  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}



