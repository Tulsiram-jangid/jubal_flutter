import 'package:flutter/material.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/screen/menu/menu_screen.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<StoreProvider>(context).getUser();

    String getName() {
      String name = user.getFullName;
      // Split the name by spaces
      List<String> nameParts = name.split(" ");
      // Get the initials
      final initials = nameParts.map((part) => part[0]).join();
      return initials;
    }

    void openMenuSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: .8,
            child: MenuScreen()
          );
        },
      );
    }

    return AppBar(
      backgroundColor: Colors.pink, // AppBar background color
      elevation: 0, // Remove shadow
      titleSpacing: 0, // Align title content to the left
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white), // Menu icon
        onPressed: () {
          openMenuSheet(context);
        },
      ),
      title: Row(
        children: [
          // Logo and title
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                // Logo image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/logo.png', // Replace with your logo path
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                // App title
                const Text(
                  "Jubal Talents",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // Notification Icon with Badge
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    Colors.black.withOpacity(0.2), // Slightly dark background
                shape: BoxShape.circle, // Circular background
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  // Handle notification tap
                },
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        // Profile Icon
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(RouteNames.myProfileScreen);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.profilePhoto ?? ""),
              backgroundColor: Colors.white,
              child: user.profilePhoto == null
                  ? Text(
                      getName(),
                      style: const TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
