import 'package:flutter/material.dart';
import 'package:madeincameroon/product/data/model/product.dart';
import 'package:madeincameroon/product/presentation/pages/detail_product_screen.dart';

import '../../../shared/utils/appColor.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final Product product;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation,
                            secondaryAnimation) =>DetailProductScreen(
                          product: product,
                        ),
                        transitionDuration:
                        Duration(milliseconds: 2000),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          return child;
                        },
                      ),
                    );
                  },
                  child: Hero(
                    tag: product.id,
                    child: Image.asset(
                      product.listUrlImage[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: colorText,
                    fontSize: 12.0,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
