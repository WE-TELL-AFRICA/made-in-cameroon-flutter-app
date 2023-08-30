

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:madeincameroon/comments/data/models/Comment.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';

class CommentView extends StatelessWidget {

  CommentView({super.key, required this.comment});

  Comment comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: colorBgBlack,
            borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0,
              right: 8.0,
              top: 16.0,
              bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(50.0),
                  child: Image.asset(
                    "assets/images/bag.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        itemSize: 14,
                        initialRating: comment.rating,
                        unratedColor: Colors.grey[300],
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(
                            horizontal: 1.0),
                        itemBuilder: (context, _) =>
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20.0,
                        ),
                        onRatingUpdate: (rating) {},
                        ignoreGestures: true,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        comment.text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: smallTextSize,
                            fontWeight:
                            FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




