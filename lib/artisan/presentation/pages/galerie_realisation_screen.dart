import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import '../../../shared/presentation/views/app_bar_main.dart';
import '../views/grid_view_gallerie.dart';

class GaleryRealisationScreen extends StatelessWidget {
  GaleryRealisationScreen({super.key, required this.listGallerieRealisation});

  List<String?>? listGallerieRealisation;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarMain(
              title: "Galérie de Realisation",
            ),
            if (listGallerieRealisation != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    for (int i = 0; i <= 10; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: GridViewGallerie(
                            listGallerie: listGallerieRealisation),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

}
