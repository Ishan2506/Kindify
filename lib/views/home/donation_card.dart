import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kindify_app/services/api_client.dart';
import 'package:kindify_app/services/toast_service.dart';
import 'package:share_plus/share_plus.dart';

class DonationCard extends StatefulWidget {
  final String postId;
  final String title;
  final String location;
  final String imageAsset;
  int totalLikes;

   DonationCard({
    super.key,
    required this.postId,
    required this.title,
    required this.location,
    required this.imageAsset,
    required this.totalLikes
  });

  @override
  State<DonationCard> createState() => _DonationCardState();
}

class _DonationCardState extends State<DonationCard> {
  bool isLiked = false;
  bool isSaved = false;
  ApiClientService _apiClient = ApiClientService();

Future<void> _toggleSave() async {
  final endpoint = isLiked ? "/api/post/unlike" : "/api/post/like";
  final body = {
    "postId": widget.postId
  };

  try {
    final response = await _apiClient.post(endpoint, body);
    final data = jsonDecode(response.body);

    if (data["success"] == true) {
      setState(() {
        isSaved = !isSaved;
        if (isSaved) {
          ToastService.showSuccess(context, "Post saved successfully");
        } else {
          ToastService.showSuccess(context, "Post unsaved successfully");
        }
        //saveCount = data["totalSaves"];  // Update total saves from response
      });
    } else {
      ToastService.showError(context, data['message']);
    }
  } catch (e) {
    ToastService.showError(context, e.toString());
  }
}
  void _sharePost() {
    Share.share('Check out this post: ${widget.imageAsset}');
  }



  Future<void> _toggleLike() async {
    final endpoint = isLiked ? "/api/post/unlike" : "/api/post/like";
    final body = {
      "postId": widget.postId
    };

  try {
    final response = await _apiClient.post(endpoint, body);

    final result = jsonDecode(response.body);
    if (response.statusCode == 200) {

      if (result['success'] == true) {
        setState(() {
          widget.totalLikes = result['totalLikes'];
          isLiked = !isLiked;
        });
      }
    } else {
      ToastService.showError(context, result['message']);
    }
  } catch (e) {
    ToastService.showError(context, e.toString());
  }
}

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
              // CircleAvatar with error handling
              _buildCircleAvatarWithErrorHandling(screenWidth),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        Text(
                          widget.location,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 6,
                        ), // small space between location & Support+
                        Text(
                          "Support+",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          // Main image with error handling
          _buildMainImageWithErrorHandling(screenHeight),
          SizedBox(height: screenHeight * 0.015),
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                    ),
                    onPressed: _toggleLike,
                  ),
                  Text('${widget.totalLikes} Likes')
                ],
              ),
              SizedBox(width: screenWidth * 0.02),
              IconButton(icon: const Icon(Icons.send), onPressed: _sharePost),
              SizedBox(width: screenWidth * 0.02),
              IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: isSaved ? Colors.blue : Colors.grey,
                ),
                onPressed: _toggleSave,
                tooltip: 'Save Post',
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(08),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.005,
                  ),
                ),
                child: Text(
                  "Donate Now",
                  style: TextStyle(fontSize: screenWidth * 0.035,color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircleAvatarWithErrorHandling(double screenWidth) {
    return CircleAvatar(
      radius: screenWidth * 0.05,
      child: ClipOval(
        child: Image.network(
          widget.imageAsset,
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
              color: Colors.grey[300],
              child: Icon(
                Icons.error_outline,
                size: screenWidth * 0.04,
                color: Colors.grey,
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
              color: Colors.grey[300],
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMainImageWithErrorHandling(double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        widget.imageAsset,
        height: screenHeight * 0.25,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: screenHeight * 0.25,
            width: double.infinity,
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 40, color: Colors.grey),
                SizedBox(height: 8),
                Text(
                  'Failed to load image',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: screenHeight * 0.25,
            width: double.infinity,
            color: Colors.grey[300],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
