import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';
import '../../data/models/category_model.dart';

class BuildFilterProduct extends StatefulWidget {
  BuildFilterProduct({super.key, required this.category});
  CategoryModel category;
  @override
  State<StatefulWidget> createState() => _BuildFilterProduct();
}
class _BuildFilterProduct extends State<BuildFilterProduct> {
  Map<CategoryModel, bool> mapCategories = {};
  List<CategoryModel> listTempCategories = [];
  @override
  void initState() {
    super.initState();
    for (CategoryModel categoryModel in widget.category.listSubCategories!) {
      mapCategories[categoryModel] = true;
    }
    refreshFilter();
  }
  void refreshFilter() {
    setState(() {
      listTempCategories = mapCategories.entries
          .where((entry) => entry.value == true)
          .map((entry) => entry.key)
          .toList();
    });
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
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            width: 35.0,
            height: 35.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: colorText,
            ),
            child: IconButton(
              onPressed: () => _showCategoryDialog(context),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 35.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listTempCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 0.0, bottom: 0.0),
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            listTempCategories[index].name,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.white),
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  mapCategories[listTempCategories[index]] =
                                      false;
                                  listTempCategories.removeAt(index);
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

  void _showCategoryDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          //print("mapCategories[] ${mapCategories.toString()}");
          return AlertDialog(
            title: const Text(
              'Sélectionnez une catégorie',
              style: TextStyle(
                  fontSize: defaultTextSize, fontWeight: FontWeight.w600),
            ),
            content: ContentDialog(
              mapCategories: mapCategories,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                          fontSize: defaultTextSize,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Valider',
                      style: TextStyle(
                          color: colorPrimary,
                          fontSize: defaultTextSize,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      refreshFilter();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}

class ContentDialog extends StatefulWidget {
  ContentDialog({Key? key, required this.mapCategories}) : super(key: key);

  Map<CategoryModel, bool> mapCategories;

  @override
  State<StatefulWidget> createState() => _ContentDialog();
}

class _ContentDialog extends State<ContentDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CheckboxListTile> categoryMenuList = [];
    widget.mapCategories.forEach((key, value) {
      categoryMenuList.add(CheckboxListTile(
        title: Text(
          key.name,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
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
}
