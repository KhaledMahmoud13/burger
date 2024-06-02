class Burger {
  final String title;
  final String image;
  final String subTitle;
  final String description;
  int quantity;
  final bool isFav;
  final String price;

  Burger({
    required this.title,
    required this.image,
    required this.subTitle,
    required this.description,
    required this.quantity,
    required this.isFav,
    required this.price,
  });

  factory Burger.fromJson(Map<String, dynamic> json) => Burger(
        title: json["title"],
        image: json["image"],
        subTitle: json["subTitle"],
        description: json["description"],
        quantity: json["quantity"],
        isFav: json["isFav"],
        price: json["price"],
      );
}
