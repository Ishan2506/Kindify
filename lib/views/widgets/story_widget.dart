
import 'package:flutter/material.dart';
import 'package:kindify_app/model/story.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/home/story_viewer_screen.dart';
class StorySection extends StatelessWidget {
  final List<Story> stories;

  const StorySection({Key? key, required this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    height: 130,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: stories.length, // Remove the +1 since we're not adding the "Add Story" circle
      itemBuilder: (context, index) {
        final story = stories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoryViewScreen(
                  stories: stories,
                  initialIndex: index, // Use the current index directly
                ),
              ),
            );
          },
          child: _buildStoryCircle(story),
        );
      },
    ),
  );
}

  Widget _buildAddStoryCircle() {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryPink, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(Icons.add, size: 32, color: AppColors.primaryPink),
          ),
          const SizedBox(height: 8),
          Text(
            "Your Story",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCircle(Story story) {
    // Construct the full image URL
    String fullImageUrl = story.imageUrl.startsWith('http')
        ? story.imageUrl
        : 'https://kindify.onrender.com${story.imageUrl}';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 250,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Circular image with error handling
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: story.isUserStory ? AppColors.primaryPink : Colors.grey,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  fullImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                        size: 24,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Title + Location
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  story.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  story.location,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (story.username != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'By ${story.username}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                      fontStyle: FontStyle.italic,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}