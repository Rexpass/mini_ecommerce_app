class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String id;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.id,
    required this.quantity,
  });
  Product copyWith({
    int? quantity,
    // other properties...
  }) {
    return Product(
      id: id,
      name: name,
      price: price,
      description: description,
      imagePath: imagePath,
      quantity: quantity ??
          this.quantity, // use provided value or default to the current value
    );
  }
}
