class FavoriteItem {
  final String image;
  final String title;
  final String description;

  FavoriteItem({
    required this.image,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description,
      };

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      image: json["image"],
      title: json["title"],
      description: json["description"],
    );
  }
}