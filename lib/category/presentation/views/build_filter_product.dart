import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../shared/data/load_data.dart';
import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';
import '../../data/models/category_model.dart';
import '../../logic/category_cubit.dart';

class BuildFilterProduct extends StatefulWidget {
  BuildFilterProduct({super.key, this.id});

  int? id;
  @override
  State<StatefulWidget> createState() => _BuildFilterProduct();
}

class _BuildFilterProduct extends State<BuildFilterProduct> {
  List<CategoryModel> listSubCategories = [];
  List<CategoryModel> listSubCategoriesShow = [];
  Map<CategoryModel, bool> mapCategories = {};

  @override
  void initState() {
    super.initState();
   //print("listSubCategoriesShow : $listSubCategoriesShow");
    listSubCategoriesShow = getListCategories();
    print("listSubCategoriesShow : $listSubCategoriesShow");
    refreshMenu();
  }
  
  getListCategories() async {
    var categoryCubit = getIt.get<CategoryCubit>();
    var categories = await categoryCubit.getCategories();
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 10.0),
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorText,
            ),
            child: IconButton(
              onPressed: () => _showCategoryDialog(context),
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 35.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 8.0),
                    padding: EdgeInsets.only(left: 16.0, top: 0.0, bottom: 0.0),
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            listCategories[index].name,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  listCategories.removeAt(index);
                                  print(
                                      "listCategories-length : ${listCategories.length}");
                                  print(
                                      "listSubCategories-length : ${listSubCategories.length}");
                                });
                              }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initContentDialog() {
    for (CategoryModel categoryModel in listSubCategoriesShow) {
      mapCategories[categoryModel] = true;
    }
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Sélectionnez une catégorie',
              style: TextStyle(
                  fontSize: defaultTextSize, fontWeight: FontWeight.w600),
            ),
            content: ContentDialog(
              categories: listSubCategories,
              mapCategories: mapCategories,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Annuler',
                        style: TextStyle(
                            fontSize: defaultTextSize,
                            fontWeight: FontWeight.w400)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Valider',
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: defaultTextSize,
                            fontWeight: FontWeight.w400)),
                    onPressed: () {
                      refreshMenu();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  void refreshMenu() {
    setState(() {});
  }
}

class ContentDialog extends StatefulWidget {
  ContentDialog(
      {Key? key, required this.categories, required this.mapCategories})
      : super(key: key);

  List<CategoryModel> categories = [];

  Map<CategoryModel, bool> mapCategories = {};

  @override
  State<StatefulWidget> createState() => _ContentDialog();
}

class _ContentDialog extends State<ContentDialog> {
  @override
  void initState() {
    super.initState();
    for (CategoryModel categoryModel in widget.categories) {
      widget.mapCategories[categoryModel] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CheckboxListTile> categoryMenuList = [];
    widget.mapCategories.forEach((key, value) {
      categoryMenuList.add(CheckboxListTile(
        title: Text(
          key.name,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
        ),
        value: value,
        onChanged: (bool? value) {
          setState(() {
            widget.mapCategories[key] = value!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ));
    });

    return SingleChildScrollView(
      child: Column(children: categoryMenuList),
    );
  }

  Widget _buildCategoryItem(
      String categoryName, List<Map<String, bool>> subcategories) {
    return ExpansionTile(
      title: Text(categoryName,
          style: TextStyle(
              fontSize: defaultTextSize, fontWeight: FontWeight.w400)),
      children: subcategories.map((subcategory) {
        String subcategoryName = subcategory.keys.first;
        bool isChecked = subcategory.values.first;

        return CheckboxListTile(
          title: Text(
            subcategoryName,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          ),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              subcategory[subcategoryName] = value!;
              //print("value : $value");
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      }).toList(),
    );
  }
}
