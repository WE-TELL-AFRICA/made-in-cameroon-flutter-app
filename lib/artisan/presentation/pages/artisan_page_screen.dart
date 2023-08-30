import 'package:flutter/material.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';
import '../../../shared/utils/appColor.dart';
import '../../data/model/artisan.dart';
import '../views/artisan_view.dart';

class ArtisanPageScreen extends StatelessWidget {
  ArtisanPageScreen({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vous voulez quelque chose \n spécial ? ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: defaultTextSize,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Trouvez les meilleurs \nartisans Camerounais Ici !",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: defaultTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                              child:
                                  Image.asset("assets/images/girl_find.png")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ArtisanView(
                    artisan: Artisan(
                      id: index,
                      urlPhotoProfile: "assets/images/profile.png",
                      ratingValue: 3.5,
                      name: "John Doe",
                      labour: "Vendor",
                      ville: "Douala",
                      description:
                          "Meilleur artisan de l'année selon le magazine des meilleurs artisans du monde ...",
                      telephone: '+237 698 741 125',
                      listGallerieRealisation: [
                        "assets/images/slider1.png",
                        "assets/images/slider2.png",
                        "assets/images/slider3.png",
                        "assets/images/bag.jpg"
                      ],
                      email: 'emailartisan@gmail.com',
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
