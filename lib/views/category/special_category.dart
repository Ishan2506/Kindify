// import 'package:flutter/material.dart';
// import 'package:kindify_app/views/category/donation_page.dart';
//
// class SpecialCategoriesPage extends StatelessWidget {
//   const SpecialCategoriesPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final categories = [
//       {
//         "title": "Food Distribution",
//         "subtitle": "Number of People",
//         "icon": Icons.restaurant,
//         "options": [
//           {"label": "10 People", "value": 1000},
//           {"label": "20 People", "value": 2000},
//           {"label": "50 People", "value": 5000},
//           {"label": "100 People", "value": 10000},
//         ],
//       },
//       {
//         "title": "School Fees Donate",
//         "subtitle": "Number of Students",
//         "icon": Icons.currency_rupee,
//         "options": [
//           {"label": "5 Students", "value": 5000},
//           {"label": "10 Students", "value": 10000},
//           {"label": "15 Students", "value": 15000},
//           {"label": "20 Students", "value": 20000},
//         ],
//       },
//       {
//         "title": "Grocery Kit Donate",
//         "subtitle": "Number of Kits",
//         "icon": Icons.shopping_bag,
//         "options": [
//           {"label": "5 Kits", "value": 1500},
//           {"label": "10 Kits", "value": 3000},
//           {"label": "20 Kits", "value": 6000},
//           {"label": "50 Kits", "value": 15000},
//         ],
//       },
//       {
//         "title": "Uniform Distribution",
//         "subtitle": "Number of Students",
//         "icon": Icons.checkroom,
//         "options": [
//           {"label": "5 Uniforms", "value": 2500},
//           {"label": "10 Uniforms", "value": 5000},
//           {"label": "20 Uniforms", "value": 10000},
//           {"label": "50 Uniforms", "value": 25000},
//         ],
//       },
//       {
//         "title": "School Bag Distribution",
//         "subtitle": "Number of Bags",
//         "icon": Icons.backpack,
//         "options": [
//           {"label": "5 Bags", "value": 2000},
//           {"label": "10 Bags", "value": 4000},
//           {"label": "20 Bags", "value": 8000},
//           {"label": "50 Bags", "value": 20000},
//         ],
//       },
//       {
//         "title": "Clothes Distribution",
//         "subtitle": "Number of People",
//         "icon": Icons.local_mall,
//         "options": [
//           {"label": "10 People", "value": 3000},
//           {"label": "20 People", "value": 6000},
//           {"label": "50 People", "value": 15000},
//           {"label": "100 People", "value": 30000},
//         ],
//       },
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Special Categories"),
//         leading: const Icon(Icons.arrow_back),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFFFF6F61), Color(0xFFFFA726)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           itemCount: categories.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             childAspectRatio: 1.0,
//           ),
//           itemBuilder: (context, index) {
//             final item = categories[index];
//             return InkWell(
//               borderRadius: BorderRadius.circular(16),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => DonationScreen(
//                       title: item["title"] as String,
//                       subtitle: item["title"] as String,
//                       options: item["options"] as List<Map<String, dynamic>>,
//                     ),
//                   ),
//                 );
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFFFF6F61), Color(0xFFFFA726)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       item["icon"] as IconData,
//                       size: 48,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(height: 12),
//                     Text(
//                       item["title"] as String,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/category/donation_page.dart';

class SpecialCategoriesPage extends StatelessWidget {
  const SpecialCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Food Distribution",
        "subtitle": "Menu",
        "icon": Icons.restaurant,
        "options": [
          {"label": "Pulav", "value": 3000},
          {"label": "Puri Sak", "value": 5000},
          {"label": "Idli sambahr", "value": 6000},
          {"label": "Full dish", "value": 10000},
        ],
      },
      {
        "title": "Grocery Kit Donate",
        "subtitle": "Number of Kits",
        "icon": Icons.shopping_bag,
        "options": [
          {"label": "5 Kits", "value": 1500},
          {"label": "10 Kits", "value": 3000},
          {"label": "20 Kits", "value": 6000},
          {"label": "50 Kits", "value": 15000},
        ],
      },
      {
        "title": "School Fees Donate",
        "subtitle": "Number of Students",
        "icon": Icons.currency_rupee,
        "options": [
          {"label": "5 Students", "value": 5000},
          {"label": "10 Students", "value": 10000},
          {"label": "15 Students", "value": 15000},
          {"label": "20 Students", "value": 20000},
        ],
      },
      {
        "title": "School Bag Distribution",
        "subtitle": "Number of Bags",
        "icon": Icons.backpack,
        "options": [
          {"label": "5 Bags", "value": 2000},
          {"label": "10 Bags", "value": 4000},
          {"label": "20 Bags", "value": 8000},
          {"label": "50 Bags", "value": 20000},
        ],
      },
      {
        "title": "Clothes Distribution",
        "subtitle": "Number of People",
        "icon": Icons.local_mall,
        "options": [
          {"label": "10 People", "value": 3000},
          {"label": "20 People", "value": 6000},
          {"label": "50 People", "value": 15000},
          {"label": "100 People", "value": 30000},
        ],
      },
      {
        "title": "Uniform Distribution",
        "subtitle": "Number of Students",
        "icon": Icons.checkroom,
        "options": [
          {"label": "5 Uniforms", "value": 2500},
          {"label": "10 Uniforms", "value": 5000},
          {"label": "20 Uniforms", "value": 10000},
          {"label": "50 Uniforms", "value": 25000},
        ],
      }
    ];

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Special Distribution", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryPink, AppColors.orange],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.0, // ✅ ensures square cards
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            return _categoryCard(
              context,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DonationScreen(
                      title: item["title"] as String,
                      subtitle: item["subtitle"] as String,
                      options: item["options"] as List<Map<String, dynamic>>,
                    ),
                  ),
                );
              },
              item["icon"] as IconData,
              item["title"] as String,
            );
          },
        ),
      ),
    );
  }

  Widget _categoryCard(
      BuildContext context,
      VoidCallback onPress,
      IconData icon,
      String categoryName,
      ) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(3), // thickness of gradient border
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
            borderRadius: BorderRadius.circular(13), // slightly smaller
          ),
          padding: const EdgeInsets.all(12),
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
                  size: MediaQuery.sizeOf(context).width * 0.15,
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
                    fontSize: MediaQuery.sizeOf(context).width * 0.04,
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

}
