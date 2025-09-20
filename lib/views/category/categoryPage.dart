import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kindify_app/services/api_client.dart';
import 'package:kindify_app/services/toast_service.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/category/donation_page.dart';
import 'package:kindify_app/views/category/foodDistribution.dart';
import 'package:kindify_app/views/category/special_category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<dynamic>> _categoriesFuture;
  final ApiClientService _apiClient = ApiClientService();
  @override
  void initState() {
    super.initState();
    _categoriesFuture = fetchCategories();
  }
  IconData getIconDataFromApiString(String? iconString) {
  switch (iconString) {
    case "FontAwesomeIcons.star":
      return FontAwesomeIcons.star;
    case "FontAwesomeIcons.bagShopping":
      return FontAwesomeIcons.bagShopping;
    case "FontAwesomeIcons.utensils":
      return FontAwesomeIcons.utensils;
    case "FontAwesomeIcons.cakeCandles":
      return FontAwesomeIcons.cakeCandles;
    case "FontAwesomeIcons.userTie":
      return FontAwesomeIcons.userTie;
    case "FontAwesomeIcons.book":
      return FontAwesomeIcons.book;
    case "FontAwesomeIcons.bottleDroplet":
      return FontAwesomeIcons.bottleDroplet;
    case "FontAwesomeIcons.indianRupeeSign":
      return FontAwesomeIcons.indianRupeeSign;
    default:
      return FontAwesomeIcons.question; // fallback
  }
}
  Future<List<dynamic>> fetchCategories() async {
    final response = await _apiClient.get("/api/categories");

    try{
      if (response.statusCode == 200) {
        debugPrint(response.body.toString());
        return jsonDecode(response.body);
      } else {
        ToastService.showError(context, "Failed to load categories");
        return [];
      }
    }
    catch(e)
    {
      ToastService.showError(context, e.toString());
      return [];
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No categories found"));
          }

          final categories = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: kToolbarHeight),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  //padding: const EdgeInsets.all(12.0), 
                  child: _specialCardColor(
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SpecialCategoriesPage(),
                        ),
                      );
                    },
                    Icons.stars,
                    "Special Distribution",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                    bottom: 50, // extra space for BottomNavigationBar
                  ),
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: MediaQuery.sizeOf(context).width * 0.08,
                      runSpacing: MediaQuery.sizeOf(context).height * 0.02,
                      children: categories.skip(1).map((category) {
                        final name = category["name"] ?? "Unknown";
                        final iconString = category["icon"] as String?;
                        final iconData = getIconDataFromApiString(iconString);
                    
                        return _categoryCard(
                          context,
                          () {
                            // Navigate dynamically
                            // Example:
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => DonationScreen(...)));
                          },
                          iconData,
                          name,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // body: SingleChildScrollView(
      //   child: SizedBox(
      //     width: MediaQuery.sizeOf(context).width,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SizedBox(height: kToolbarHeight),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 12),
      //           child: _specialCardColor(context,() {
      //              Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) {
      //                       return SpecialCategoriesPage();
      //                     },
      //                   ),
      //                 );

      //           },Icons.stars,"Special Distribution"),
      //         ),              Wrap(
      //           runAlignment: WrapAlignment.center,
      //           spacing: MediaQuery.sizeOf(context).width * 0.08,
      //           runSpacing: MediaQuery.sizeOf(context).height * 0.02,
      //           children: [
      //             _categoryCard(
      //               context,
      //               () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) {
      //                       return FoodDistribution();
      //                     },
      //                   ),
      //                 );
      //               },
      //               Icons.food_bank_rounded,
      //               "Food Distribution",
      //             ),
      //             _categoryCard(
      //               context,
      //               () {},
      //               Icons.shopping_bag_outlined,
      //               "Bags Distribution",
      //             ),
      //             _categoryCard(
      //               context,
      //               () {},
      //               Icons.menu_book_sharp,
      //               "Books Distribution",
      //             ),
      //             _categoryCard(
      //               context,
      //               () {},
      //               Icons.shopping_bag_outlined,
      //               "Bags Distribution",
      //             ),
      //             _categoryCard(
      //               context,
      //               () {},
      //               Icons.menu_book_sharp,
      //               "Books Distribution",
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _categoryCard(
    BuildContext context,
    VoidCallback onPress,
    IconData icon,
    String categoryName,
  ) {
    final double cardSize =
        MediaQuery.sizeOf(context).width * 0.35; // same width & height
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(3),
        // border thickness
        width: cardSize,
        height: cardSize,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryPink, AppColors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(8), // inner padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Gradient Icon
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Icon(
                  icon,
                  size: cardSize * 0.35, // responsive icon size
                  color: Colors.white,
                ),
              ),

              // Gradient Text
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: cardSize * 0.12, // responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _specialDistributionCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
            gradient: const LinearGradient(
              colors: [AppColors.primaryPink, AppColors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.stars_rounded, size: 40, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: Text(
                            "Special Distribution",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(
                size: 18,
                Icons.arrow_forward_ios_outlined,
                color: Colors.white, // Needed so gradient is visible
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _specialCardColor(
      BuildContext context,
      VoidCallback onPress,
      IconData icon,
      String categoryName,
      ) {
    final double cardSize = MediaQuery.sizeOf(context).width * 0.35; // same width & height

    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: cardSize,
        height: cardSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [AppColors.primaryPink, AppColors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: cardSize * 0.35, // same as categoryCard
              color: Colors.white,
            ),
            Text(
              categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: cardSize * 0.12, // same as categoryCard
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
