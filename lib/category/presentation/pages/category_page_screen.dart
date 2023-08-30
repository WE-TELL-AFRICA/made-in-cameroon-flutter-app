import 'package:flutter/material.dart';
import 'package:madeincameroon/category/presentation/views/rect_category_view.dart';
import 'package:madeincameroon/shared/data/load_data.dart';

import '../../../shared/utils/appColor.dart';

class CategoryPageScreen extends StatelessWidget {
  const CategoryPageScreen({super.key,
    required this.scaffoldKey,});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: const BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 32.0,
                        )),
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Choississez une catégorie pour en explorer les articles...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: listCategories.length,
              itemBuilder: (context, index) {
                return RectCategoryView(
                    category: listCategories[index]);
              }),
        )
      ],
    );
  }
}




