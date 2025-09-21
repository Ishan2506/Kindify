import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/request/request_page.dart';

class RequestSelectedCategory extends StatefulWidget {
  RequestSelectedCategory({super.key, required this.categoryName});

  String? categoryName;

  @override
  State<RequestSelectedCategory> createState() =>
      _RequestSelectedCategoryState();
}

class _RequestSelectedCategoryState extends State<RequestSelectedCategory> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _appBarContainer(widget.categoryName),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        runSpacing: screenWidth * 0.03,
                        children: [
                          _categoryCard(
                            () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return RequestPage(categoryName: widget.categoryName,trustName: "Dwarkadish Trust");
                              },));
                            },
                            "Dwarkadish Trust",
                            "Opp. Abc Mall, Maninagar, Ahmedabad-382344",
                          ),
                          _categoryCard(
                            () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return RequestPage(categoryName: widget.categoryName,trustName: "Krishna Trust");
                              },));
                            },
                            "Krishna Trust",
                            "Opp. Abc Mall, Maninagar, Ahmedabad-382344",
                          ),
                          _categoryCard(
                            () {

                            },
                            "SevaMandal Trust",
                            "Opp. Abc Mall, Maninagar, Ahmedabad-382344",
                          ),
                          _categoryCard(
                            () {

                            },
                            "GaneshJi Trust",
                            "Opp. Abc Mall, Maninagar, Ahmedabad-382344",
                          ),
                          _categoryCard(
                            () {

                            },
                            "ABC Trust",
                            "Opp. Abc Mall, Maninagar, Ahmedabad-382344",
                          ),
                          _categoryCard(
                            () {

                            },
                            "XYZ Trust",
                            "Opp. Abc Mall, Maninagar, Ahmedabad-382344",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBarContainer(String? categoryName) {
    return Container(
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
        title: Text(
          categoryName ?? 'Category Name',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _categoryCard(VoidCallback onTapSelect,String? trustName, String? trustAddress) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onTapSelect,
      child: Container(
        width: screenWidth * 0.43, // responsive width
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(6, 6)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // light grey shadow
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(2, 3), // horizontal, vertical shift
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Fixed Image Section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(6, 6),
                topRight: Radius.elliptical(6, 6),
              ),
              child: SizedBox(
                height: screenWidth * 0.25, // fixed image height
                child: Image.network(
                  "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/03/28/Pictures/_982f2cde-7094-11ea-9530-7febd198d354.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Text Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          colors: [AppColors.primaryPink, AppColors.orange],
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      trustName ?? 'TrustName',
                      textAlign: TextAlign.center,
                      maxLines: 2, // <-- restrict to 2 lines
                      overflow: TextOverflow.ellipsis, // <-- show ...
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trustAddress ?? 'TrustAddress',
                    textAlign: TextAlign.center,
                    maxLines: 2, // <-- restrict to 2 lines
                    overflow: TextOverflow.ellipsis, // <-- show ...
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
