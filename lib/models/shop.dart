import 'package:flutter/material.dart';
import 'package:mini_ecommerce_application/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    //product 1
    Product(
      name: "Nike Dunk Low",
      price: 6325,
      id: '01',
      description:
          "The '80s basketball icon returns with classic details and throwback hoops flair.",
      imagePath: 'assets/nike-dunk-low.png',
      quantity: 100,
    ),
    //product 2
    Product(
      name: "Air Jordan 1 Mid",
      price: 6875,
      id: '02',
      description:
          "Inspired by the original AJ1, this mid-top edition maintains the iconic look.",
      imagePath: 'assets/air-jordan-1-mid.png',
      quantity: 100,
    ),
    //product 3
    Product(
      name: "Nike Air Max 1",
      price: 7700,
      id: '03',
      description:
          "Meet the leader of the pack. Walking on clouds above the noise.",
      imagePath: 'assets/nike-air-max-1.png',
      quantity: 100,
    ),
    //product 4
    Product(
      name: "LeBron XXI Tahitian",
      price: 11000,
      id: '04',
      description:
          "The LeBron XXI has a cabling system that works with Zoom Air cushionong.",
      imagePath: 'assets/lebron-xxi-tahitian.png',
      quantity: 100,
    ),
    //product 5
    Product(
      name: "Air Jordan 1 Zoom CMFT 2",
      price: 8250,
      id: '05',
      description:
          "Premium suede and Jordan Brand's signature Formula 23 foam come together to give you an extra luxurious",
      imagePath: 'assets/air-jordan-1-zoom-cmft-2.png',
      quantity: 100,
    ),
    //product 6
    Product(
      name: "Nike Invincible 3",
      price: 9900,
      id: '06',
      description:
          "With maximum cushioning to support every mile, the Invincible 3 has our highest level of comfort underfoot.",
      imagePath: 'assets/nike-invincible-3.png',
      quantity: 100,
    ),
    //product 7
    Product(
      name: "Nike Pegasus 40",
      price: 7150,
      id: '07',
      description:
          "A springy ride for any run, the Peg’s familiar, just-for-you feel returns to help you accomplish your goals.",
      imagePath: 'assets/nike-pegasus-40.png',
      quantity: 100,
    ),
    //product 8
    Product(
      name: "Nike Air Force 1'07",
      price: 6325,
      id: '08',
      description: "The radiance lives on in the Nike Air Force 1'07",
      imagePath: 'assets/nike-air-force-1-07.png',
      quantity: 100,
    ),
    //product 9
    Product(
      name: "Nike Air Max 270",
      price: 8800,
      id: '09',
      description: "Step boldly into your day with Nike Air Max 270.",
      imagePath: 'assets/nike-air-max-270.png',
      quantity: 100,
    ),
    //product 10
    // Product(
    //   name: "Nike Air VaporMax 2023 Flyknit",
    //   price: 210,
    //   description:
    //       "Hav you ever walked on Air? Step into the Air VaporMax 2023 to see how it's done.",
    //   imagePath: 'assets/nike-air-vapormax-2023-flyknit.png',
    // ),
  ];

  // User cart with quantity
  List<Product> _cart = [];

  // Get product list
  List<Product> get shop => _shop;

  // Get user cart
  List<Product> get cart => _cart;

  get user => null;

  // Calculate total price of items in the cart
  double calculateTotalPrice() {
    double total = 0;
    for (var item in _cart) {
      total += item.price * item.quantity;
    }
    return total;
  }

  // Add item to cart
  void addToCart(Product item) {
    // Check if the product is already in the cart
    int existingIndex =
        _cart.indexWhere((existingItem) => existingItem.id == item.id);

    if (existingIndex != -1) {
      // If the product is already in the cart, increment the quantity
      _cart[existingIndex].quantity += 1;
    } else {
      // If the product is not in the cart, add it as a new item with quantity 1
      _cart.add(item.copyWith(quantity: 1));
    }

    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Product item) {
    // Decrement the quantity and remove the item if quantity becomes zero
    int existingIndex =
        _cart.indexWhere((existingItem) => existingItem.id == item.id);

    if (existingIndex != -1) {
      _cart[existingIndex].quantity -= 1;
      if (_cart[existingIndex].quantity == 0) {
        _cart.removeAt(existingIndex);
      }
    }

    notifyListeners();
  }
}
