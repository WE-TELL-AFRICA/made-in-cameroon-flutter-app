import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madeincameroon/category/data/models/category_model.dart';
import 'package:madeincameroon/shared/presentation/views/elevated_button_back.dart';
import 'package:madeincameroon/category/presentation/views/build_filter_product.dart';
import '../../../product/presentation/views/gridview_product.dart';
import '../../../shared/data/load_data.dart';
import '../../../settings.dart';

class CategoryDetailScreen extends StatefulWidget {
  CategoryDetailScreen({super.key, required this.category});

  CategoryModel category;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  "$BASE_URL$REF_IMAGE/${widget.category.image!.urlImage}",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
                width: double.infinity,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButtonBack(
                    sizeIcon: 18.0,
                    text: "${widget.category.name}",
                  ),
                ),
              )
            ],
          ),
          BuildFilterProduct(
            category: widget.category,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                GridViewProduct(listProduct: listProducts),
                SizedBox(
                  height: 32.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
