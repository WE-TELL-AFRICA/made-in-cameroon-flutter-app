import 'package:flutter/material.dart';
import '../../data/model/product.dart';
import 'product_view.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    super.key,
    required this.listProduct,
  });

  final List<Product> listProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: listProduct.length,
          itemBuilder: (context, index) {
            return ProductView(
                product: Product(
              listUrlImage: listProduct[index].listUrlImage,
              name: listProduct[index].name,
              id: listProduct[index].id,
              description: '',
              isApprove: true,
              categoryId: 1,
            ));
          }),
    );
  }
}
