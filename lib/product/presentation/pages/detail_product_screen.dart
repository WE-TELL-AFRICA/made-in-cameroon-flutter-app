import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madeincameroon/shared/presentation/views/icon_button_back.dart';
import 'package:madeincameroon/comments/data/models/Comment.dart';
import 'package:madeincameroon/product/data/model/product.dart';
import 'package:madeincameroon/product/presentation/styles/text_title_primary.dart';
import 'package:madeincameroon/product/presentation/views/gridview_product.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';
import 'package:madeincameroon/shared/utils/dimens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../comments/presentation/views/comment_view.dart';
import '../../../shared/data/load_data.dart';
import '../views/app_text_field.dart';

class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({super.key, required this.product});

  Product product;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    print("print Product detailScreen : ${widget.product.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[80],
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: IconButtonBack(
                                color: colorText,
                                sizeIcon: 32.0,
                              ),),
                          Hero(
                            tag: widget.product.id,
                            child: CarouselSlider.builder(
                              itemCount: widget.product.listUrlImage.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          widget.product.listUrlImage[index],
                                        ),
                                      )),
                                );
                              },
                              options: CarouselOptions(
                                  height: 300,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.7,
                                  autoPlayAnimationDuration: Duration(seconds: 2),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  }),
                            ),
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
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(48.0),
                                topRight: Radius.circular(48.0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1)),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colorText,
                                  fontSize: defaultTextSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextTitlePrimary(title: "Description"),
                              SizedBox(
                                height: 5.0,
                              ),
                              ExpandableText(
                                "Description ... Description, Description,Description, Description, Description, Description, Description, Description, Description ",
                                textAlign: TextAlign.left,
                                maxLines: 3,
                                style: TextStyle(
                                    color: colorText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: defaultTextSize),
                                expandText: 'Voir plus',
                                collapseText: 'voir moins',
                                animation: true,
                                animationDuration: Duration(microseconds: 1000),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              TextTitlePrimary(title: "Contacter"),
                              SizedBox(
                                height: 5.0,
                              ),
                              /*
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "+237 698 745 159",
                                    style: TextStyle(
                                        color: colorText,
                                        fontSize: defaultTextSize,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: colorPrimary,
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white,
                                          size: defaultSizeIcon,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "emailuser@gmail.com",
                                    style: TextStyle(
                                        color: colorText,
                                        fontSize: defaultTextSize,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: colorPrimary,
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.white,
                                          size: defaultSizeIcon,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                               */
                              SizedBox(
                                height: 8.0,
                              ),
                              TextTitlePrimary(
                                  title: "Information complémentaires"),
                              Text(
                                "Entreprise : Maya Bio Entreprise",
                                style: TextStyle(
                                    color: colorText,
                                    fontSize: defaultTextSize,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextTitlePrimary(title: "Commentaires"),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      onPrimary: Colors.grey,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    child: const Text(
                                      "Voir plus >",
                                      style: TextStyle(
                                          color: colorPrimary, fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return CommentView(
                                      comment: Comment(
                                        id: 1,
                                        idUser: 1,
                                        idProduct: 1,
                                        rating: 3.5,
                                        text: 'lorem ipsum dollar si amet',
                                      ),
                                    );
                                  }),
                              SizedBox(
                                height: 16.0,
                              ),
                              TextTitlePrimary(title: "Articles similaires"),
                              SizedBox(
                                height: 16.0,
                              ),
                              GridViewProduct(listProduct: listProducts),
                              SizedBox(
                                height: 64.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    contactVendor();
                  },
                  child: SizedBox(
                    width: 190,
                    height: 80,
                    child: Align(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/bg_bottom_detail_artisan.svg",
                            alignment: Alignment.bottomRight,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "Commander",
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
        ),
      ),
    );
  }

  Future<void> contactVendor() async {
    final isCommand = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choisissez une action'),
          content: ListView(
            children: [
              AppTextField(
                label: "Téléphone",
                hintText: "Entrer un numéro de téléphone",
                fontSize: smallTextSize,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 8.0,
              ),
              AppTextField(
                label: "Description",
                hintText:
                    "Entrer une Description de la commande, la quantité que voulez et autres informations...",
                textInputType: TextInputType.text,
                fontSize: smallTextSize,
                maxLine: 6,
              ),
            ],
          ),
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
              child: Text(
                'Commander',
                style: TextStyle(color: colorPrimary),
              ),
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
              child: Text(
                'Annuler',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                print("Choose Email");
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.product.listUrlImage.length,
        effect: const ScrollingDotsEffect(
            dotColor: colorGreyLight,
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: colorPrimary),
      );
}
