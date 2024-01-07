import 'package:flutter/material.dart';
import 'package:mini_ecommerce_application/components/my_textfield.dart';
import 'package:mini_ecommerce_application/components/signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:mini_ecommerce_application/pages/shop_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // User Login Method
  void loginUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // Login Page logo
                const Icon(
                  Icons.shopping_bag,
                  size: 100,
                  color: Color.fromARGB(255, 32, 81, 34),
                ),

                const SizedBox(height: 20),

                // Login page Text
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 14, 13, 13),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),

                const SizedBox(height: 10),

                // sign in button Method
                SigninButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/shop_page');
                  },
                ),

                const SizedBox(height: 15),

                // I haven't an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup_page');
                      },
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // Signin With Google Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: const Text('Sign In with Google'),
                  onPressed: () {},
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
