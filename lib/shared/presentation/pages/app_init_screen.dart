import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeincameroon/category/logic/category_cubit.dart';
import 'package:madeincameroon/category/logic/category_state.dart';
import 'package:madeincameroon/welcome/presentation/pages/welcome_page.dart';

class AppInitScreen extends StatelessWidget {
  const AppInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state.successLoadingCategory) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
                (route) => false);
          }
        },
        child: const Center(
          child: CupertinoActivityIndicator(
            radius: 60,
          ),
        ),
      ),
    );
  }
}
