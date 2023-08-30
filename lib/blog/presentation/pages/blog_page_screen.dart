import 'package:flutter/material.dart';
import 'package:madeincameroon/blog/presentation/widgets/blog_view.dart';
import '../../../shared/presentation/views/app_bar_main.dart';
import '../../data/Blog.dart';

class BlogPageScreen extends StatelessWidget {
  const BlogPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarMain(
              title: "Blog",
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return BlogView(
                          blog: Blog(
                        id: 1,
                        name: "MY ROOTS HANDMADE",
                        shortDescription:
                            "La marque Camerounaise qui promeut le textile",
                        longDescription:
                            "Ces dernières années le secteur du textile est vraiment minoritaire et très peu présent dans notre contexte, d'où l'urgence pour notre start-up de mettre les points sur i en insitants sur ce secteur d'activité minoritiaire dans le notre contexte",
                        urlImage: "assets/images/blog/jus.jpg",
                      ));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
