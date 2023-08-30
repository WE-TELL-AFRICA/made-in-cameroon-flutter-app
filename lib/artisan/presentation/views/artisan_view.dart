import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';
import '../../../shared/utils/appColor.dart';
import '../../data/model/artisan.dart';
import '../pages/artisan_detail_screen.dart';

class ArtisanView extends StatelessWidget {
  const ArtisanView({super.key, required this.artisan});

  final Artisan artisan;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(0, 2)),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: smallPadding, vertical: 8.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.all(Radius.circular(50.0)),
                    child: Image.asset(
                        artisan.urlPhotoProfile ?? "assets/images/placeholder.jpg"),
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                artisan.labour,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: colorText,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                artisan.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: colorGrey,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              RatingBar.builder(
                itemSize: 14,
                initialRating: artisan.ratingValue,
                unratedColor: Colors.grey[300],
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                onRatingUpdate: (rating) {},
                ignoreGestures: true,
              ),
              const SizedBox(
                height: 3.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtisanDetailScreen(artisan: artisan,)));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: colorPrimary,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Voir",
                        style: TextStyle(
                          fontSize:smallTextSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
