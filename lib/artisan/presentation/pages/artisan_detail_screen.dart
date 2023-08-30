import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madeincameroon/artisan/presentation/pages/galerie_realisation_screen.dart';
import 'package:madeincameroon/artisan/presentation/styles/text_title_style.dart';
import 'package:madeincameroon/artisan/presentation/views/grid_view_gallerie.dart';
import 'package:madeincameroon/shared/presentation/views/icon_button_back.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/artisan.dart';

class ArtisanDetailScreen extends StatelessWidget {
  ArtisanDetailScreen({super.key, required this.artisan});

  Artisan artisan;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/images/bg_top_detail_artisan.svg",
                    alignment: Alignment.topLeft,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButtonBack(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artisan.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                              Text(
                                artisan.labour,
                                style: TextStyle(
                                    color: colorGreyLight, fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              RatingBar.builder(
                                itemSize: 14,
                                initialRating: 3,
                                unratedColor: Colors.grey[300],
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                onRatingUpdate: (rating) {},
                                ignoreGestures: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          SizedBox(
                            height: 100,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              child: Image.asset(artisan.urlPhotoProfile ??
                                  "assets/images/placeholder.jpg"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 16.0,
                ),
                TextTitle(title: "Description "),
                SizedBox(
                  height: 5.0,
                ),
                ExpandableText(
                  artisan.description ?? " ...",
                  textAlign: TextAlign.justify,
                  maxLines: 4,
                  style: TextStyle(
                      color: colorText,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0),
                  expandText: 'Voir plus',
                  collapseText: 'voir moins',
                  animation: true,
                  animationDuration: Duration(microseconds: 1000),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextTitle(title: "Coordonnées "),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  artisan.telephone,
                  style: TextStyle(
                      color: colorText,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  artisan.email,
                  style: TextStyle(
                      color: colorText,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                    Text(
                      artisan.ville,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: colorText,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextTitle(title: "Galerie de réalisation "),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GaleryRealisationScreen(
                              listGallerieRealisation:
                                  artisan.listGallerieRealisation,
                            ),
                          ),
                        );
                      },
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
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                if (artisan.listGallerieRealisation != null)
                  GridViewGallerie(
                      listGallerie: artisan.listGallerieRealisation),
              ],
            ),
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: ()  {
                print("in onTap same same");
                clicOnBoutonContact(context);
              },
              child: SizedBox(
                width: 180,
                height: 60,
                child: Align(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/bg_bottom_detail_artisan.svg",
                        alignment: Alignment.bottomRight,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Contacter",
                              style: TextStyle(color: Colors.white),
                            ),
                            Flexible(
                                child: SizedBox(
                              width: 20.0,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Future<void> clicOnBoutonContact(BuildContext context) async {
    print("Clic on the bouton");
    final isPhone = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choisissez une action'),
          content: Text(
              'Voulez-vous passer un appel ou envoyer un e-mail ?'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Appel', style: TextStyle(color: Colors.black),),
              onPressed: () {
                print("Choose Phone");
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.grey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('E-mail', style: TextStyle(color: Colors.black),),
              onPressed: () {
                print("Choose Email");
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    if (isPhone != null) {
      print("Options Choose Phone");
      if (isPhone) {
        // Rediriger vers les contacts pour lancer l'appel
        final url = 'tel:699435498';
        if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
    } else {
    throw 'Impossible de lancer l\'appel';
    }
    } else {
    // Ouvrir Google Gmail pour envoyer un e-mail
    final url = 'mailto:kemmegneemerick@gmail.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
    throw 'Impossible d\'ouvrir l\'application de messagerie';
    }
    }
  }
  }

}
