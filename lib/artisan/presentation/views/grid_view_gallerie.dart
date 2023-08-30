import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridViewGallerie extends StatefulWidget {

   GridViewGallerie({super.key, required this.listGallerie});
  List<String?>? listGallerie;

   @override
   State<GridViewGallerie> createState() => _GridViewGallerieState();
}


class _GridViewGallerieState extends State<GridViewGallerie> {

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 30000), (){
      setState(() {
        _isLoading = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.listGallerie!.length,
        itemBuilder: (context, index) {
          return _isLoading ? getShimmerLoading() : ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              widget.listGallerie![index]!,
              fit: BoxFit.cover,
            ),
          );
        });
  }


  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
      ),
    );
  }
}




