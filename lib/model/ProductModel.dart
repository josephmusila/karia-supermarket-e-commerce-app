class Product {
  String id;
  String name;
  final String category;
  String imageUrl;
  String description;
  double price;
  int quantity;

  Product(
      {required this.id,
      required this.quantity,
      required this.name,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.price});
}
