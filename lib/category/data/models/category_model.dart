import 'package:madeincameroon/shared/data/Model/image_model.dart';

class CategoryModel {
  CategoryModel(
      {required this.id,
      required this.name,
      this.image,
      this.parendId,
      this.createdAt,
      this.updatedAt});

  @override
  String toString() {
    return 'CategoryModel{id: $id, parendId: $parendId, name: $name, image: $image, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  int id;
  int? parendId;
  String name;
  ImageModel? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      parendId: json["parent_id"],
      name: json["name"],
      image: (json["image_cover"] != null) ? ImageModel.fromJson(json["image_cover"]) : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}
