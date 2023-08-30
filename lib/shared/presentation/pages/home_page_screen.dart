import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeincameroon/category/logic/category_cubit.dart';
import 'package:madeincameroon/category/logic/category_state.dart';
import '../../../category/data/models/category_model.dart';
import '../../../locator.dart';
import '../../../product/presentation/views/gridview_product.dart';
import '../../utils/appColor.dart';
import '../../../product/data/model/product.dart';
import '../../../category/presentation/views/circle_category_view.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({
    super.key,
    required this.scaffoldKey,
    required this.listCategories,
    required this.listProducts,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<CategoryModel> listCategories;
  final List<Product> listProducts;



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 210,
            decoration: const BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: colorGrey,
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Text(
                                  "Rechercher ...",
                                  style: TextStyle(
                                      color: colorGrey, fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0, left: 16.0),
                            child: Text(
                              "Prêt à faire \nles courses ?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Image.asset("assets/images/girl_buy.png")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 16.0, bottom: 16.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                    color: colorText,
                    fontSize: 14.0,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onPrimary: Colors.grey,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      "Voir plus >",
                      style: TextStyle(color: colorPrimary, fontSize: 14.0),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 85,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                bloc: getIt.get<CategoryCubit>(),
                builder: (context, state) {
                  if (state.isLoadingCategory) {
                    return CupertinoActivityIndicator();
                  }
                  if (state.errorLoadingCategory) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              getIt.get<CategoryCubit>().getCategories();
                            },
                            icon: const Icon(
                              Icons.refresh,
                              size: 50,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text("${state.message}"),
                        ],
                      ),
                    );
                  }
                  if (state.categories?.isEmpty ?? true) {
                    return Center(
                      child: InkWell(
                          onTap: () {
                            getIt.get<CategoryCubit>().getCategories();
                          },
                          child: Text("Aucune categories")),
                    );
                  }
                  if (state.categories != null) {
                    List<CategoryModel> categories = state.categories!;
                    List<CategoryModel> listCategoriesParent = categories
                        .where((value) => value.parendId == null)
                        .toList();
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listCategoriesParent.length,
                        itemBuilder: (context, index) {
                          return CircleCategoryView(
                              category: listCategoriesParent[index]);
                        });
                  }
                  return Container();
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Align(alignment: Alignment.topLeft, child: Text("Produits")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridViewProduct(listProduct: listProducts),
          ),
        ],
      ),
    );
  }
}
