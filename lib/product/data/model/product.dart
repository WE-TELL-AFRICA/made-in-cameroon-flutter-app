class Product {
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.isApprove,
      required this.information,
      this.createdAt,
      this.updateAt,
      this.userId,
      required this.categoryId,
      required this.listUrlImage});

  int id;
  String name;
  String description;
  bool isApprove;
  String information;
  DateTime? createdAt;
  DateTime? updateAt;
  int? userId;
  int categoryId;
  List<String> listUrlImage;


  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, isApprove: $isApprove, information: $information, createdAt: $createdAt, updateAt: $updateAt, userId: $userId, categoryId: $categoryId, listUrlImage: $listUrlImage}';
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isApprove: (json['is_approve']==1),
      information: json['information'],
      categoryId: json['category_id'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      listUrlImage: List<String>.from(json['images'].map((image) => image["url_image"] as String).toList()),
    );
  }
}

/**
 *
 *
    {
    "id": 1,
    "name": "Biscuit naya fait maison",
    "description": "Meilleur Biscuit Naya produit au Cameroun",
    "information": "Entreprise",
    "is_approve": 1,
    "created_at": "2023-09-08T01:42:55.000000Z",
    "updated_at": "2023-09-08T01:42:55.000000Z",
    "user_id": null,
    "category_id": 19,
    "images": [
    {
    "id": 4,
    "url_image": "1694137376_Biscuit-Naya-a-La-Creme.jpg",
    "created_at": "2023-09-08T01:42:56.000000Z",
    "updated_at": "2023-09-08T01:42:56.000000Z",
    "product_id": 1
    }
    ]
    },
 *
 */
