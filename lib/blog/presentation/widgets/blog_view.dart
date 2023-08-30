import 'package:flutter/material.dart';
import 'package:madeincameroon/blog/presentation/pages/blog_detail_screen.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';
import '../../data/Blog.dart';

class BlogView extends StatelessWidget {
  BlogView({super.key, required this.blog});

  Blog blog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        elevation: 2,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 180,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  child: Image.asset(
                    blog.urlImage,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.name,
                        style: TextStyle(
                            color: colorText,
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        blog.shortDescription,
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        blog.longDescription,
                        maxLines: 3,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: colorGrey,
                            fontSize: extraSmallTextSize,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colorPrimary,
                                onPrimary: Colors.white,
                                textStyle: TextStyle(
                                  fontSize: smallTextSize,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BlogDetailScreen(blog: blog)));
                              },
                              child: Center(
                                child: Text(
                                  "Voir plus",
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
