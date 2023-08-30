import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madeincameroon/product/presentation/views/image_item_view.dart';
import 'package:madeincameroon/shared/utils/provide_image.dart';
import '../../../shared/presentation/views/app_bar_main.dart';
import '../../../shared/presentation/views/button_icon.dart';
import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';
import '../views/app_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<File?> listFileImage = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarMain(title: "Ajouter Produit"),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Image produit : ",
                        style: TextStyle(
                            color: colorText,
                            fontWeight: FontWeight.normal,
                            fontSize: defaultTextSize),
                      ),
                      ButtonIcon(
                        iconData: Icons.add,
                        onClick: () {
                          ProvideImage provideImage = ProvideImage(
                              context: context,
                              getImage: getImage);
                          provideImage.showModal();
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 120,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        ListView.builder(
                            padding: EdgeInsets.all(smallPadding),
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listFileImage.length,
                            itemBuilder: (context, index) {
                              return ImageItemView(
                                  fileImage: listFileImage[index]!,
                                  onClick: () {
                                    setState(() {
                                      listFileImage.removeAt(index);
                                    });
                                  });
                            }),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  const AppTextField(
                    label: "Nom Produit",
                    hintText: "Entrer le nom du produit",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const AppTextField(
                    label: "Prix Produit",
                    hintText: "Entrer le prix du produit",
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const AppTextField(
                    label: "Fabricant Produit",
                    hintText: "Entrer le nom du fabricant du produit",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const AppTextField(
                    label: "Téléphone du Fabricant Produit",
                    hintText: "Entrer le numéro du fabricant du produit",
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const AppTextField(
                    label: "Lien utile (site web ou page)",
                    hintText: "url utile",
                    isRequired: false,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const AppTextField(
                    label: "Adresse mail",
                    hintText: "Entrer votre adresse mail",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: colorPrimary,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Envoyer",
                            style: TextStyle(
                              fontSize: defaultTextSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        listFileImage.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }
}
