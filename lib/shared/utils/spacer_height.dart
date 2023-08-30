import 'package:flutter/material.dart';


class SpacerHeight extends StatelessWidget {
  SpacerHeight({super.key, this.height = 8.0});

  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}



