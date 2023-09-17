import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeincameroon/category/data/models/category_model.dart';
import 'package:madeincameroon/shared/presentation/views/elevated_button_back.dart';
import 'package:madeincameroon/category/presentation/views/build_filter_product.dart';
import '../../../locator.dart';
import '../../../product/logic/product_cubit.dart';
import '../../../product/logic/product_state.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BlocBuilder<ProductCubit, ProductState>(
                    bloc: getIt.get<ProductCubit>(),
                    buildWhen: (previousState, currentState) {
                      return previousState.listProducts?.length !=
                          currentState.listProducts?.length;
                    },
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return CupertinoActivityIndicator();
                      }
                      if (state is ProductFailure) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  getIt.get<ProductCubit>().getProducts(index: 1);
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(height: 30),
                              //Text("${state.message}"),
                            ],
                          ),
                        );
                      }
                      if (state is ProductSuccess){
                        print("load product success");
                        if (state.listProducts != null) {
                          print("state.listProducts : ${state.listProducts!.map((e) =>e.name)}");
                          return Column(
                            children: [
                              GridViewProduct(listProduct: state.listProducts!),
                              const SizedBox(
                                height: 8.0,
                              ),
                              (state.numberNextPage != null)
                                  ? Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print("++++++number for next page : ${state.numberNextPage}");
                                    getIt
                                        .get<ProductCubit>()
                                        .getProducts(index: state.numberNextPage!);

                                    print("------number for next page : ${state.numberNextPage}");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    elevation: 2,
                                    padding: EdgeInsets.all(8.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Voir plus",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )
                                  : Container(),
                            ],
                          );
                        }
                      }

                      return Container();
                    },
                  ),
                ),
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
