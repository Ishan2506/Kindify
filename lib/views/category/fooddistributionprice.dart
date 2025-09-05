import 'package:flutter/material.dart';

class FoodDistributionPage extends StatefulWidget {
  @override
  _FoodDistributionPageState createState() => _FoodDistributionPageState();
}

class _FoodDistributionPageState extends State<FoodDistributionPage> {
  double donationValue = 100;
  double previousValue = 100;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              /// Top Gradient Bar
              Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(screenWidth * 0.04),
                  //   bottomRight: Radius.circular(screenWidth * 0.04),
                  // ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: screenWidth * 0.03),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white, size: screenWidth * 0.06),
                    ),
                    Text(
                      "Food Distribution",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              /// Main Body
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Donation Info Box
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.home_outlined,
                                    color: Colors.orange, size: screenWidth * 0.06),
                                SizedBox(width: screenWidth * 0.03),
                                Text(
                                  "Donation",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: _selectDate,
                              child: Icon(Icons.calendar_month,
                                  color: Colors.orange, size: screenWidth * 0.06),
                            ),
                          ],
                        ),
                      ),

                      /// Selected Date (if any)
                      if (selectedDate != null)
                        Text(
                          "Selected: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      /// Donation Limit Title
                      Text(
                        "Donation Limit",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),

                      /// CASINO-STYLE ROLLING NUMBER ANIMATION
                      Container(
                        height: screenHeight * 0.1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Background for casino effect
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.orange, width: 2),
                              ),
                            ),
                            
                            // Rolling number animation
                            _buildCasinoNumberAnimation(),
                          ],
                        ),
                      ),

                      /// Slider
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: screenWidth * 0.04),
                          trackHeight: 6,
                        ),
                        child: Slider(
                          value: donationValue,
                          min: 100,
                          max: 9000,
                          divisions: 90,
                          activeColor: Colors.orange,
                          inactiveColor: Colors.orange.withOpacity(0.3),
                          thumbColor: Colors.deepOrange,
                          onChanged: (value) {
                            setState(() {
                              previousValue = donationValue;
                              donationValue = value;
                            });
                          },
                        ),
                      ),

                      /// Donate Now Button with better styling
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          // color: Colors.orange.withOpacity(0.1),
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹ 100 - 9000",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle donation logic
                                _showDonationConfirmation();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05,
                                  vertical: screenHeight * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  // color: Colors.white,  
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Donate Now",
                                  style: TextStyle(
                                  color: Colors.orange,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      /// Bottom Text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Text(
                          "Your donation helps provide nutritious meals to those in need. "
                          "Every contribution makes a difference in someone's life.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.grey,
                          ),
                        ),
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

  Widget _buildCasinoNumberAnimation() {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: previousValue, end: donationValue),
      duration: Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenWidth * 0.02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            "₹ ${value.toStringAsFixed(0)}",
            style: TextStyle(
              fontSize: screenWidth * 0.09,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontFamily: 'Courier', // Monospace font for casino feel
              letterSpacing: 1.2,
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showDonationConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Donation"),
        content: Text("Are you sure you want to donate ₹${donationValue.toStringAsFixed(0)}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessMessage();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "🎉 Donation of ₹${donationValue.toStringAsFixed(0)} successful!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}