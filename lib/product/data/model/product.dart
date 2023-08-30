
class Product {
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.isApprove,
      this.createdAt,
      this.updateAt,
      this.userId,
      required this.categoryId,
      required this.listUrlImage});

  int id;
  String name;
  String description;
  bool isApprove;
  DateTime? createdAt;
  DateTime? updateAt;
  int? userId;
  int categoryId;
  List<String> listUrlImage;

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, isApprove: $isApprove, createdAt: $createdAt, updateAt: $updateAt, userId: $userId, categoryId: $categoryId, listUrlImage: $listUrlImage}';
  }
}
