import 'package:flutter/material.dart';
import 'package:madeincameroon/category/presentation/pages/category_detail_screen.dart';

import '../../../shared/utils/appColor.dart';
import '../../data/models/category_model.dart';

class CircleCategoryView extends StatelessWidget {
  const CircleCategoryView({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen()));
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: colorPrimary,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        category.image!.urlImage,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              category.name,
              style: const TextStyle(color: colorBlack, fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }
}
