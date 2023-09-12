import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madeincameroon/artisan/presentation/pages/add_profil_artisan.dart';
import 'package:madeincameroon/shared/presentation/pages/apropos_page_screen.dart';
import 'package:madeincameroon/blog/presentation/pages/blog_page_screen.dart';
import 'package:madeincameroon/chat/presentation/pages/chat_page_screen.dart';
import 'package:madeincameroon/shared/presentation/pages/contact_page_screen.dart';
import 'package:madeincameroon/product/presentation/pages/add_product_screen.dart';
import 'package:madeincameroon/shared/utils/makeToast.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';
import 'package:madeincameroon/artisan/presentation/pages/artisan_page_screen.dart';
import 'package:madeincameroon/category/presentation/pages/category_page_screen.dart';
import 'package:madeincameroon/user/presentation/pages/profil_page_screen.dart';
import '../../../category/logic/category_cubit.dart';
import '../../../locator.dart';
import '../../../product/logic/product_cubit.dart';
import '../../data/load_data.dart';
import '../../utils/dimens.dart';
import 'home_page_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    //getIt.get<CategoryCubit>().getCategories();
    getIt.get<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomePageScreen(
          scaffoldKey: _scaffoldKey,),
      ArtisanPageScreen(
        scaffoldKey: _scaffoldKey,
      ),
      CategoryPageScreen(
        scaffoldKey: _scaffoldKey,
      ),
      ProfilPageScreen(
        scaffoldKey: _scaffoldKey,
      )
    ];

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _children,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(0), topLeft: Radius.circular(0)),
        child: BottomNavigationBar(
          elevation: 2,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_paint),
              label: 'Artisans',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Compte',
            ),
          ],
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          backgroundColor: colorPrimary,
          selectedItemColor: Colors.white,
          unselectedItemColor: colorGreyLight,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: colorPrimary,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 70,
                    width: 70 * 1.5,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/logo.jpg"),
                        )),
                  ),
                  const Text(
                    "Made In Cameroon",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const Text(
                    "@copywright 2023",
                    style: TextStyle(color: colorGreyLight, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  menuItem(
                    1,
                    "Ajouter des Produits",
                    Icons.add_box,
                  ),
                  menuItem(
                    2,
                    "Créer un profil Artisan",
                    Icons.create_new_folder,
                  ),
                  menuItem(
                    3,
                    "Chat",
                    Icons.chat,
                  ),
                  menuItem(
                    4,
                    "Blog",
                    Icons.article_outlined,
                  ),
                  menuItem(
                    5,
                    "A propos",
                    Icons.info_outline,
                  ),
                  menuItem(
                    6,
                    "Contacts",
                    Icons.contact_phone,
                  ),
                  const Divider(),
                  menuItem(
                    7,
                    "Déconnexion",
                    Icons.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            switch (id) {
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddProductScreen()));
                break;
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddProfilArtisan()));
                break;
              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPageScreen()));
                break;
              case 4:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlogPageScreen()));

                break;
              case 5:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AproposPageScreen()));
                break;
              case 6:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactPageScreen()));
                break;
              case 7:
                MakeToast.show("Click sur Deconnexion");
                break;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                icon,
                size: sizeIconDrawer,
                color: Colors.black,
              )),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  addProduct,
  chat,
  blog,
  aPropos,
  contact,
  logout,
}
