import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
 
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(   // 👈 ensures it doesn’t go under status bar
      bottom: false,   // keep only top padding
      child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryPink,AppColors.orange],
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.arrow_back, color: Colors.white),
              title: Text(
                "Contact With Us",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
