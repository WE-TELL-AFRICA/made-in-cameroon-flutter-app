import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';

class ArtisanDetailScreen extends StatelessWidget {
  const ArtisanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/images/bg_top_detail_artisan.svg",
                    alignment: Alignment.topLeft,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      print("tap");
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Myrlènne",
                            style:
                            TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          Text(
                            "Couturière chevronné",
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
                              child: Image.asset("assets/images/bag.jpg"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description ",
                          style: TextStyle(
                              color: colorText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                        SizedBox(height: 5.0,),
                        for(int i = 0; i < 20; i ++)
                          Text(
                            "Lorem ipsum dollar si amet, Lorem ipsum dollar si amet, Lorem ipsum dollar si amet, Lorem ipsum dollar si amet, Lorem ipsum dollar si amet, Lorem ipsum dollar si amet, Lorem ipsum dollar si amet ",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: colorText,
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
