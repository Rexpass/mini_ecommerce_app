import 'package:flutter/material.dart';
import 'package:mini_ecommerce_application/components/my_button.dart';
import 'package:mini_ecommerce_application/models/product.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  // Calculate total price method considering the quantity
  double calculateTotalPrice(List<Product> cart) {
    double total = 0;
    for (var item in cart) {
      total += item.price * item.quantity;
    }
    return total;
  }

  // Remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // Show a dialog box to ask a user to confirm removing item from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // Yes button
          MaterialButton(
            onPressed: () {
              // Pop dialog box
              Navigator.pop(context);

              // Remove from cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  // User pressed checkout button, go to the checkout page
  void payButtonPressed(BuildContext context) {
    Navigator.pushNamed(context, '/checkout_page');
  }

  @override
  Widget build(BuildContext context) {
    // Get access to the cart
    final cart = context.watch<Shop>().cart;
    final totalPrice = calculateTotalPrice(cart);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My Cart"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // Get individual item in cart
                      final item = cart[index];

                      // Return as a cart tile UI
                      return ListTile(
                        title: Text(
                            "${item.name} x${item.quantity}"), // Display quantity
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          // Total price
          Text(
            'Total Price: \ETB ${totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          // Checkout button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text("Go to Checkout"),
            ),
          )
        ],
      ),
    );
  }
}
