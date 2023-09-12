import 'package:madeincameroon/shared/data/Model/image_model.dart';

import '../../category/data/models/category_model.dart';
import '../../product/data/model/product.dart';

List<Product> listProducts = [
  Product(
    id: 1,
    name: "Jus de fruits par banaloba compagny",
    listUrlImage: [
      "assets/images/products/jus_fruit_banaloba.jpg",
      "assets/images/products/biscuit_naya.jpg",
      "assets/images/products/chips.jpg"
    ],
    description: '',
    isApprove: true,
    categoryId: 1,
    information: '',
  ),
  Product(
    id: 2,
    name: "Les Biscuits Naya À La Crème couleur",
    listUrlImage: ["assets/images/products/biscuit_naya.jpg"],
    description: '',
    isApprove: true,
    categoryId: 1,
    information: '',
  ),
  Product(
    id: 3,
    name: "Apéro Chips De Banane Plantain Sucré",
    listUrlImage: ["assets/images/products/chips.jpg"],
    description: '',
    isApprove: true,
    categoryId: 1,
    information: '',
  ),
  Product(
    id: 4,
    name: "Bakourous Croquettes D’arachides Par Vlita",
    listUrlImage: ["assets/images/products/croquette.jpg"],
    description: '',
    isApprove: true,
    categoryId: 1,
    information: '',
  ),
  Product(
    id: 5,
    name: "Jus de fruits par banaloba compagny",
    listUrlImage: [
      "assets/images/products/jus_fruit_banaloba.jpg",
      "assets/images/products/biscuit_naya.jpg",
      "assets/images/products/chips.jpg"
    ],
    description: '',
    isApprove: true,
    categoryId: 1,
    information: '',
  ),
  Product(
    id: 6,
    name: "Jus de fruits par banaloba compagny",
    listUrlImage: [
      "assets/images/products/jus_fruit_banaloba.jpg",
      "assets/images/products/biscuit_naya.jpg",
      "assets/images/products/chips.jpg"
    ],
    description: '',
    isApprove: true,
    categoryId: 1,
    information: '',
  ),
];

List<CategoryModel> listCategories = [
  CategoryModel(
    id: 1,
    name: "Alimentaire",
    image: ImageModel(
        id: 1,
        productId: 1,
        urlImage: "assets/images/categories/alimentaire.jpg"),
  ),
  CategoryModel(
    id: 2,
    name: "Cosmetiques",
    image: ImageModel(
        id: 1,
        productId: 1,
        urlImage: "assets/images/categories/cosmetiques.jpg"),
  ),
  CategoryModel(
    id: 3,
    name: "Maison",
    image: ImageModel(
        id: 1, productId: 1, urlImage: "assets/images/categories/maison.jpg"),
  ),
  CategoryModel(
    id: 4,
    name: "Mode",
    image: ImageModel(
        id: 1, productId: 1, urlImage: "assets/images/categories/maison.jpg"),
  ),
  CategoryModel(
    id: 4,
    name: "Sante",
    image: ImageModel(
        id: 1, productId: 1, urlImage: "assets/images/categories/sante.jpg"),
  ),
  CategoryModel(
    id: 5,
    name: "bayam",
    image: ImageModel(
        id: 1,
        productId: 1,
        urlImage: "assets/images/categories/alimentaire.jpg"),
  ),
  CategoryModel(
    id: 6,
    name: "Beaute",
    image: ImageModel(
        id: 1,
        productId: 1,
        urlImage: "assets/images/categories/cosmetiques.jpg"),
  ),
];
