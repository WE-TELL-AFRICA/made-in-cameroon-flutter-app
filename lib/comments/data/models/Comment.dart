class Comment {
  Comment(
      {required this.id,
      required this.rating,
      required this.text,
      required this.idUser,
      required this.idProduct});

  int id;
  double rating;
  String text;
  int idUser;
  int idProduct;

  @override
  String toString() {
    return 'Comment{id: $id, rating: $rating, text: $text, idUser: $idUser, idProduct: $idProduct}';
  }
}
