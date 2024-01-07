import 'package:flutter/material.dart';
import 'package:mini_ecommerce_application/components/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // drawer header: logo
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Color.fromARGB(255, 32, 81, 34),
                    //Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // shop page
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                // onTap: () => Navigator.pop(context),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop_page');
                },
              ),

              // cart page
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),

              // Profile page
              MyListTile(
                text: "Profile",
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile_page');
                },
              ),

              // about page
              MyListTile(
                text: "About",
                icon: Icons.info,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/about_us');
                },
              ),
            ],
          ),

          // logout page
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Logout",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/login_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
