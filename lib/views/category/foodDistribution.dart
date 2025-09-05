import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/category/categoryPage.dart';
import 'package:kindify_app/views/category/fooddistributionprice.dart';

class FoodDistribution extends StatefulWidget {
  const FoodDistribution({super.key});

  @override
  State<FoodDistribution> createState() => _FoodDistributionState();
}

class _FoodDistributionState extends State<FoodDistribution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Food Distribution", style: TextStyle(color: Colors.white)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.9,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _trustInfoCards(
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return FoodDistributionPage();
                          },));
                        },
                        "Food Distribution Trust Name",
                        "Support +",
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _trustInfoCards(
    VoidCallback callFunc,
    String trustName,
    String subText,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
        vertical: MediaQuery.sizeOf(context).height * 0.015,
      ),
      child: InkWell(
        onTap: callFunc,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: MediaQuery.sizeOf(context).height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/03/28/Pictures/_982f2cde-7094-11ea-9530-7febd198d354.jpg",
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      height: MediaQuery.sizeOf(context).width * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.55,
                          child: Text(
                            trustName,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [AppColors.primaryPink, AppColors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Text(
                            subText,
                            style: TextStyle(color: Colors.white,fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.primaryPink, AppColors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Icon(
                  size: 18,
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white, // Needed so gradient is visible
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
