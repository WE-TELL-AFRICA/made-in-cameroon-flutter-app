class ImageModel {
  ImageModel(
      {required this.id,
      this.productId,
      required this.urlImage,
      this.createdAt,
      this.updatedAt});

  int id;
  String urlImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productId;

  @override
  String toString() {
    return 'ImageModel{id: $id, urlImage: $urlImage, createdAt: $createdAt, updatedAt: $updatedAt, productId: $productId}';
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json["id"],
      productId: json["product_id"],
      urlImage: json["url_image"],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}
