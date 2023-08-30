import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';

List<String> elementsSelected = [];

Map<String, bool> mapCategoryMenu = {
  'Pieds nue': false,
  'Basket': true,
  'Jordan': false,
  'Tennis': false,
  'Paire': false,
  'Mocassin': true
};

class BuildFilterProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BuildFilterProduct();
}

class _BuildFilterProduct extends State<BuildFilterProduct> {
  @override
  void initState() {
    super.initState();
    refreshMenu();
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
                itemCount: elementsSelected.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 8.0),
                      padding:
                          EdgeInsets.only(left: 16.0, top: 0.0, bottom: 0.0),
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              elementsSelected[index],
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    elementsSelected.removeAt(index);
                                  });
                                }),
                          ],
                        ),
                      ));
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
          return AlertDialog(
            title: Text(
              'Sélectionnez une catégorie',
              style: TextStyle(
                  fontSize: defaultTextSize, fontWeight: FontWeight.w600),
            ),
            content: ContentDialog(),
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
    setState(() {
      elementsSelected = [];
      mapCategoryMenu.forEach((key, value) {
        if(value) elementsSelected.add(key);
      });
    });
  }
}

class ContentDialog extends StatefulWidget {
  const ContentDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContentDialog();
}

class _ContentDialog extends State<ContentDialog> {
  @override
  Widget build(BuildContext context) {

    List<CheckboxListTile> categoryMenuList = [];

    mapCategoryMenu.forEach((key, value) {
      categoryMenuList.add(CheckboxListTile(
        title: Text(
          key,
          style: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.normal),
        ),
        value: value,
        onChanged: (bool? value) {
          setState(() {
            mapCategoryMenu[key] = value!;
            //print("value : $value");
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ));

    });




    return SingleChildScrollView(
      child: Column(
        children: categoryMenuList ),
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
            style: TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.normal),
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
