class FavoriteItem {
  final String image;
  final String title;
  final String description;
  final String? tourismId;

  FavoriteItem({
    required this.image,
    required this.title,
    required this.description,
    this.tourismId,
  });

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "description": description,
    if (tourismId != null) "tourismId": tourismId,
  };

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      image: json["image"],
      title: json["title"],
      description: json["description"],
      tourismId: json["tourismId"],
    );
  }
}
