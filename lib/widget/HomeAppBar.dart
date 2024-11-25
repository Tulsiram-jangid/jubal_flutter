import 'package:flutter/material.dart';
import 'package:my_app/route/routeName.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink, // AppBar background color
      elevation: 0, // Remove shadow
      titleSpacing: 0, // Align title content to the left
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white), // Menu icon
        onPressed: () {
          // Handle menu icon tap
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
                SizedBox(width: 8),
                // App title
                Text(
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
                icon: Icon(Icons.notifications, color: Colors.white),
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
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10,),
        // Profile Icon
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(RouteNames.myProfileScreen);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "MS",
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
