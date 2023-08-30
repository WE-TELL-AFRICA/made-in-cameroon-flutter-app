import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeincameroon/category/logic/category_cubit.dart';
import 'package:madeincameroon/shared/presentation/pages/app_init_screen.dart';
import 'package:madeincameroon/welcome/presentation/pages/welcome_page.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) => getIt.get<CategoryCubit>()..getCategories(),
        ),
      ],
      child: MaterialApp(
        title: 'Made In Cameroon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "inter",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: WelcomePage(),
      ),
    );
  }
}
