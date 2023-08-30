import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madeincameroon/shared/presentation/views/icon_button_back.dart';
import 'package:madeincameroon/category/presentation/views/build_filter_product.dart';

import '../../../product/presentation/views/gridview_product.dart';
import '../../../shared/data/load_data.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/categories/alimentaire.jpg",
                      fit: BoxFit.cover,
                    )),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.18)),
                  height: 250,
                  width: double.infinity,
                  child: const Center(
                    child: Text("ALIMENTAIRE, ALIMENTAIRE, ALIMENTAIRE ",
                      textAlign : TextAlign.center ,
                      style:  TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
                IconButtonBack(
                  sizeIcon: 32.0,
                )
              ],
            ),
            BuildFilterProduct(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridViewProduct(listProduct: listProducts),
            ),
          ],
        ),
      ),
    );
  }
}
