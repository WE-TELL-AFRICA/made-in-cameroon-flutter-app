import 'package:flutter/material.dart';
import 'package:madeincameroon/category/presentation/pages/category_detail_screen.dart';

import '../../../settings.dart';
import '../../../shared/utils/appColor.dart';
import '../../data/models/category_model.dart';

class RectCategoryView extends StatelessWidget {
  const RectCategoryView({super.key, required this.category});

  final CategoryModel category;
  static const double defaultRadius = 5.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailScreen(
                category: category,
              ),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                    image: NetworkImage(
                      "$BASE_URL$REF_IMAGE/${category.image!.urlImage}",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colorText.withOpacity(0.3),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorText.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(defaultRadius),
                  bottomLeft: Radius.circular(defaultRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
