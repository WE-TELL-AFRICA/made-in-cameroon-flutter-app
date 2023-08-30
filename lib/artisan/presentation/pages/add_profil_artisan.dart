import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../product/presentation/views/app_text_field.dart';
import '../../../product/presentation/views/image_item_view.dart';
import '../../../shared/presentation/views/app_bar_main.dart';
import '../../../shared/presentation/views/button_icon.dart';
import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';
import '../../../shared/utils/provide_image.dart';

class AddProfilArtisan extends StatefulWidget {
  const AddProfilArtisan({super.key});

  @override
  State<AddProfilArtisan> createState() => _AddProfilArtisanState();
}

class _AddProfilArtisanState extends State<AddProfilArtisan> {
  File? fileImageProfile;

  List<File?> listFileImage = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarMain(title: "Créer un profil artisan"),
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  (fileImageProfile != null)
                      ? Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(100.0),
                              image: DecorationImage(
                                  image:
                                      FileImage(File(fileImageProfile!.path)),
                                  fit: BoxFit.cover)),
                        )
                      : Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/placeholder.jpg"),
                              )),
                        ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorPrimary),
                    child: IconButton(
                      onPressed: () {
                        ProvideImage provideImage =
                            ProvideImage(context: context, getImage: getImage);
                        provideImage.showModal();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          fileImageProfile = null;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.delete,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  AppTextField(
                    label: "Nom d'artiste",
                    hintText: "Entrer un nom d'artiste",
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  AppTextField(
                    label: "Téléphone",
                    hintText: "Entrer un numéro de téléphone",
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  AppTextField(
                    label: "Email",
                    hintText: "Entrer un email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  AppTextField(
                    label: "Description",
                    hintText: "Entrer un Description de votre talent d'artiste",
                    textInputType: TextInputType.text,
                    maxLine: 5,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Ajouter des images de vos ouvrages  : ",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: colorText,
                              fontWeight: FontWeight.normal,
                              fontSize: defaultTextSize),
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      ButtonIcon(
                        iconData: Icons.add,
                        onClick: () {
                          ProvideImage provideImage = ProvideImage(
                              context: context, getImage: getImageForList);
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
                    child: Padding(
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
        fileImageProfile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageForList(ImageSource source) async {
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
