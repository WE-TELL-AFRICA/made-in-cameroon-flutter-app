import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madeincameroon/category/data/models/category_model.dart';
import 'package:madeincameroon/category/data/repositories/category_repository.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';
import 'package:madeincameroon/shared/presentation/pages/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int activeIndex = 0;
  List urlImage = [
    "assets/images/slider1.png",
    "assets/images/slider2.png",
    "assets/images/slider3.png"
  ];
  List titleImage = [
    "Trouver les produits de qualités made in Cameroun",
    "Trouver les meilleurs artisans made in Cameroun",
    "Alors qu’attendez vous ? \nRejoignez nous dès maintenant "
  ];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    var list = await CategoryRepository(dio: Dio()).getAll();
    List<CategoryModel> listCategoriesParent = list.where((value) => value.parendId == null).toList();
    print("listCategories Parent : length ${listCategoriesParent.length}----${listCategoriesParent}");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      appBar: null,
      extendBody: false,
      body: Stack(children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/background.png"))),
            ),
            Stack(
              children: [
                Positioned(
                  top: -60,
                  left: -30,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: colorPrimary, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Bienvenue",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0, left: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.forward,
                        size: 32.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 80,
                    width: 80 * 1.5,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/logo.jpg"),
                        )),
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: urlImage.length,
                  itemBuilder: (context, index, realIndex) {
                    return buildImage(urlImage[index], titleImage[index]);
                  },
                  options: CarouselOptions(
                      height: 350,
                      autoPlay: true,
                      //autoPlayAnimationDuration: Duration(seconds: 1),
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      }),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                buildIndicator(),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImage.length,
        effect: const ScrollingDotsEffect(
            dotColor: colorGreyLight,
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: colorPrimary),
      );

  Widget buildImage(String urlImage, String titleImage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(urlImage)),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        ),
        Container(
          decoration: BoxDecoration(
              color: colorPrimary.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  bottomLeft: (Radius.circular(8.0)),
                  bottomRight: (Radius.circular(8.0)))),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titleImage,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
