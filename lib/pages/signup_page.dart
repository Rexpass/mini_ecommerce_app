import 'package:flutter/material.dart';
import 'package:mini_ecommerce_application/components/my_textfield.dart';
// import 'package:mini_ecommerce_application/services/auth_services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // text editing controller
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final AuthService authService = AuthService();

  // sign user up method
  void signUserUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.shopping_bag,
                  size: 90,
                  color: Color.fromARGB(255, 32, 81, 34),
                ),

                const SizedBox(height: 20),

                // Signup text
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Name Textfield
                const SizedBox(height: 25),
                MyTextField(
                  controller: nameController,
                  hintText: 'Enter Your Name',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),

                // Email TextField

                MyTextField(
                  controller: emailController,
                  hintText: 'Enter Your Email',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                // Password TextField

                MyTextField(
                  controller: passwordController,
                  hintText: 'Enter Your Password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),

                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () => (),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login_page');
                      },
                      child: const Text(
                        'Signin',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
