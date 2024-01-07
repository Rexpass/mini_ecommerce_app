import 'package:flutter/material.dart';
import 'package:mini_ecommerce_application/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const Icon(
              Icons.shopping_bag,
              size: 75,
              color: Color.fromARGB(255, 32, 81, 34),
              //Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),
            //title
            const Text(
              "Unique Fashion",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),

            const SizedBox(height: 10),

            //subtitle
            const Text(
              "Welcome to Unique",
              style: TextStyle(
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 25),

            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/login_page'),
              // child: const Icon(Icons.arrow_forward),
              child: const Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
