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
        "subtitle": "Number of People",
        "icon": Icons.restaurant,
        "options": [
          {"label": "Pulav", "value": 3000},
          {"label": "Puri Sak", "value": 5000},
          {"label": "Idli sambhar", "value": 6000},
          {"label": "Full dish", "value": 10000},
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
        "title": "Uniform Distribution",
        "subtitle": "Number of Students",
        "icon": Icons.checkroom,
        "options": [
          {"label": "5 Uniforms", "value": 2500},
          {"label": "10 Uniforms", "value": 5000},
          {"label": "20 Uniforms", "value": 10000},
          {"label": "50 Uniforms", "value": 25000},
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
    ];

    return Scaffold(
      
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ListTile(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                title: const Text(
                  "Special Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          //SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DonationScreen(
                            title: item["title"] as String,
                            subtitle: item["title"] as String,
                            options: item["options"] as List<Map<String, dynamic>>,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF6F61), Color(0xFFFFA726)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item["icon"] as IconData,
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item["title"] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
