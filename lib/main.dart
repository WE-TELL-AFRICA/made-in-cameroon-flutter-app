import 'package:flutter/material.dart';
import 'package:madeincameroon/welcome/presentation/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Made In Cameroon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "inter",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: WelcomePage(),
    );
  }
}
