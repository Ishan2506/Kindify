import 'package:flutter/material.dart';
import 'package:kindify_app/model/story.dart';
import 'package:kindify_app/utils/colors.dart';

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
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddStoryCircle();
          } else {
            final story = stories[index - 1];
            return _buildStoryCircle(story);
          }
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

//   Widget _buildStoryCircle(Story story) {
//     return Container(
//       margin: const EdgeInsets.only(right: 16),
//       child: Column(
//         children: [
//           // Story Circle with gradient border and image
//           Container(
//             width: 250,
//             height: 90,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               gradient: const LinearGradient(
//                 colors: [AppColors.primaryPink, AppColors.orange],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.15),
//                   blurRadius: 8,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(3.0),
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.white, width: 120),
//                         image: DecorationImage(
//                           image: NetworkImage(story.imageUrl),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),

//                     Column(
//                       children: [
//                         Text(
//                           story.title,
//                           style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                             height: 1.2,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // SizedBox(
//           //   width: 80,
//           //   child: Text(
//           //     story.title,
//           //     style: const TextStyle(
//           //       fontSize: 12,
//           //       fontWeight: FontWeight.w600,
//           //       color: Colors.black87,
//           //       height: 1.2,
//           //     ),
//           //     maxLines: 2,
//           //     overflow: TextOverflow.ellipsis,
//           //     textAlign: TextAlign.center,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

Widget _buildStoryCircle(Story story) {
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
        // Circular image
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(story.imageUrl),
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
              ),
              const SizedBox(height: 4),
              Text(
                story.location,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


}
