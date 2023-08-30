import 'package:flutter/material.dart';
import 'package:madeincameroon/shared/presentation/views/app_bar_main.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';
import '../../data/Blog.dart';

class BlogDetailScreen extends StatelessWidget {
  BlogDetailScreen({super.key, required this.blog});

  Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          AppBarMain(title: blog.name),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: AssetImage(blog.urlImage), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  blog.shortDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: colorPrimary,
                    fontSize: defaultTextSize,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  blog.longDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: colorText,
                    fontSize: defaultTextSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
