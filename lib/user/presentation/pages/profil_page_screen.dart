import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/provide_image.dart';
import '../views/field_account.dart';

class ProfilPageScreen extends StatefulWidget {
  ProfilPageScreen({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<ProfilPageScreen> createState() => _ProfilPageScreenState();
}

class _ProfilPageScreenState extends State<ProfilPageScreen> {
  File? fileImageProfile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(200.0),
              )),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          widget.scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 32.0,
                        )),
                    Text(
                      "Page Utilisateur",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                            image: FileImage(File(fileImageProfile!.path)),
                            fit: BoxFit.cover),
                      ),
                    )
                  : Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/placeholder.jpg"),
                        ),
                      ),
                    ),
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: colorPrimary),
                child: IconButton(
                    onPressed: () {
                      ProvideImage provideImage =
                      ProvideImage(context: context, getImage: getImage);
                      provideImage.showModal();
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              FieldAccount(
                iconDataLeft: Icons.person,
                value: "emailuser@gmail.com",
              ),
              SizedBox(
                height: 16.0,
              ),
              FieldAccount(
                iconDataLeft: Icons.account_balance_outlined,
                value: "Déconnexion",
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.logout),
                ),
              ),
            ],
          ),
        )
      ],
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
}
