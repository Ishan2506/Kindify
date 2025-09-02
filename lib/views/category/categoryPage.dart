import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/category/foodDistribution.dart';
import 'package:kindify_app/views/login/login_screen.dart';
import 'package:kindify_app/views/terms_conditions/terms_conditions.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.orange, AppColors.primaryPink],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: const Text(
            "Donation Categories",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.1,
            vertical: MediaQuery.sizeOf(context).height * 0.01,
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: MediaQuery.sizeOf(context).width * 0.04,
                runSpacing: MediaQuery.sizeOf(context).height * 0.02,
                children: [
                  _categoryCard(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FoodDistribution();
                          },
                        ),
                      );
                    },
                    Icons.food_bank_rounded,
                    "Food \nDistribution",
                  ),
                  _categoryCard(
                    () {},
                    Icons.shopping_bag_outlined,
                    "Bags \nDistribution",
                  ),
                  _categoryCard(
                    () {},
                    Icons.menu_book_sharp,
                    "Books \nDistribution",
                  ),
                  _categoryCard(
                    () {},
                    Icons.cake_rounded,
                    "Birthday Special \nDistribution",
                  ),
                  _categoryCard(
                    () {},
                    Icons.shopping_bag_outlined,
                    "Bags \nDistribution",
                  ),
                  _categoryCard(
                    () {},
                    Icons.menu_book_sharp,
                    "Books \nDistribution",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _categoryCard(
    VoidCallback onPress,
    IconData icon,
    String categoryName,
  ) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.sizeOf(context).width * 0.38,
        height: MediaQuery.sizeOf(context).height * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [AppColors.primaryPink, AppColors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: Icon(icon, size: 60, color: Colors.white),
            ),
            Expanded(
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 4,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
