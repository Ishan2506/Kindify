import 'package:flutter/material.dart';
import 'package:kindify_app/controller/request/requestController.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/request/request_selected_category.dart';

class RequestSelectDate extends StatefulWidget {
  const RequestSelectDate({super.key});

  @override
  State<RequestSelectDate> createState() => _RequestSelectDateState();
}

class _RequestSelectDateState extends State<RequestSelectDate> {
  final RequestController requestController = RequestController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _appBarContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  children: [
                    _requestDateContainer(screenWidth, requestController),
                    _categoryContainer(
                      screenWidth,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestSelectedCategory(
                              categoryName: "Food Distribution",
                            ),
                          ),
                        );
                      },
                      "Food Distribution",
                      Icons.food_bank_rounded,
                    ),
                    _categoryContainer(
                      screenWidth,
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestSelectedCategory(
                              categoryName: "Books Distribution",
                            ),
                          ),
                        );
                      },
                      "Books Distribution",
                      Icons.menu_book_sharp,
                    ),
                    _categoryContainer(
                      screenWidth,
                          () {},
                      "Bags Distribution",
                      Icons.backpack,
                    ),
                    _categoryContainer(
                      screenWidth,
                          () {},
                      "Fees Donation",
                      Icons.currency_rupee,
                    ),
                    _categoryContainer(
                      screenWidth,
                          () {},
                      "Grocery Distribution",
                      Icons.local_grocery_store_rounded,
                    ),
                    _categoryContainer(
                      screenWidth,
                          () {},
                      "Clothes Distribution",
                      Icons.checkroom_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBarContainer() {
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
        title: const Text(
          "Special Distribution",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _requestDateContainer(
      double screenWidth,
      RequestController controller,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: screenWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withValues(alpha: 0.6)),
        borderRadius: const BorderRadius.all(Radius.elliptical(6, 6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.primaryPink, AppColors.orange],
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              controller.selectedDate != null
                  ? "${controller.selectedDate!.day}/${controller.selectedDate!.month}/${controller.selectedDate!.year}"
                  : "Select Date",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.primaryPink, AppColors.orange],
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: InkWell(
              onTap: () async {
                await controller.pickDate(context);
                setState(() {}); // refresh UI
              },
              child: const Icon(Icons.calendar_month_sharp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryContainer(
      double screenWidth,
      VoidCallback onTapSelect,
      String? categoryName,
      IconData? iconData,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTapSelect,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [AppColors.primaryPink, AppColors.orange],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: Icon(iconData ?? Icons.category, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [AppColors.primaryPink, AppColors.orange],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: Text(
                    categoryName ?? "Donation",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
