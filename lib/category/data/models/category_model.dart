import 'package:equatable/equatable.dart';
import 'package:madeincameroon/shared/data/Model/image_model.dart';

class CategoryModel extends Equatable {
  final int id;
  final int? parendId;
  final String name;
  final ImageModel? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryModel(
      {required this.id,
      required this.name,
      this.image,
      this.parendId,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return 'CategoryModel{id: $id, parendId: $parendId, name: $name, image: $image, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      parendId: json["parent_id"],
      name: json["name"],
      image: (json["image_cover"] != null)
          ? ImageModel.fromJson(json["image_cover"])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}
