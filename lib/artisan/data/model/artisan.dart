class Artisan {
  Artisan(
      {required this.id,
      required this.urlPhotoProfile,
      required this.ratingValue,
      required this.name,
      required this.labour,
      required this.ville,
      required this.telephone,
      required this.email,
      this.listGallerieRealisation,
      this.description,});

  int id;
  String? urlPhotoProfile;
  double ratingValue;
  String name;
  String labour;
  String ville;
  String telephone;
  String email;
  List<String>? listGallerieRealisation;
  String? description;
}
