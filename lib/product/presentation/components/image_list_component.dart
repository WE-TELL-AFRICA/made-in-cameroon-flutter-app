import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/presentation/views/button_icon.dart';
import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';


class ImageListComponent extends StatefulWidget {
  ImageListComponent({super.key});


  List<File?> listFileImage = [];
  @override
  State<ImageListComponent> createState() => _ImageListComponentState();
}

class _ImageListComponentState extends State<ImageListComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 120.0,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('Choose from gallery'),
                          onTap: () {
                            getImage(ImageSource.gallery);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_camera),
                          title: Text('Take a photo'),
                          onTap: () {
                            getImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );

            },
          ),
        ],
      );
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        widget.listFileImage.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

}
