import 'package:flutter/material.dart';
import '../components/my_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  //Sign out  Method
  void signOutUser() {}

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
              Icons.person,
              size: 75,
              color: Color.fromARGB(255, 32, 81, 34),
              //Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),
            //title
            const Text(
              "User Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),

            const SizedBox(height: 10),

            //subtitle
            const Text(
              "user@info.com",
              style: TextStyle(
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 25),

            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/login_page'),
              // child: const Icon(Icons.arrow_forward),
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
