class Favorite {
  int id;
  String title;
  String image;
  String rating;
  String released;
  Favorite(
      {required this.id,
      required this.title,
      required this.image,
      required this.rating,
      required this.released});

  Favorite.fromMap({required map})
      : id = map["id"],
        title = map["title"] ?? "",
        image = map["image"] ?? "",
        rating = map["rating"] ?? "",
        released = map["released"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "rating": rating,
      "released": released
    };
  }
}
