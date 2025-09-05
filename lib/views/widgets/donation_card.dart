// donation_card.dart
import 'package:flutter/material.dart';
import 'package:kindify_app/views/home/donateNow.dart';// Correct import

class DonationCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageAsset;

  const DonationCard({
    super.key,
    required this.title,
    required this.location,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: imageAsset.startsWith('http')
                    ? NetworkImage(imageAsset)
                    : AssetImage(imageAsset) as ImageProvider,
                radius: screenWidth * 0.05,
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "Support+",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: imageAsset.startsWith('http')
                  ? NetworkImage(imageAsset)
                  : AssetImage(imageAsset) as ImageProvider,
              height: screenHeight * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Row(
            children: [
              const Icon(Icons.favorite_border),
              SizedBox(width: screenWidth * 0.04),
              const Icon(Icons.send),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DonateNowPage()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.015,
                  ),
                ),
                child: const Text("Donate Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// REMOVE the DonateNowPage class from this file