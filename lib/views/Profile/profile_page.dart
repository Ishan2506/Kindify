// import 'package:flutter/material.dart';
// import 'package:kindify_app/utils/colors.dart';

// class ProfilePages extends StatelessWidget {
//   const ProfilePages({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Column(
//         children: [
//           /// 🔹 Custom Gradient Header (Reduced Height)
//           Container(
//             padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).padding.top,
//                 bottom: 10,
//               ),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [AppColors.primaryPink, AppColors.orange],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.vertical(
//                 bottom: Radius.circular(24),
//               ),
//             ),
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     /// 🔙 Back + Title
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         ),
//                         const Text(
//                           "My Profile",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(width: 48), // balance for back button
//                       ],
//                     ),

//                     const SizedBox(height: 10),

//                     /// 🔹 Profile Image
//                     CircleAvatar(
//                       radius: screenWidth * 0.16, // bigger image
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: screenWidth * 0.15,
//                         backgroundImage: NetworkImage(
//                           "https://i.pravatar.cc/300?img=15", // replace with real user img
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 12),

//           /// 🔹 Username & Info
//           Column(
//             children: const [
//               Text(
//                 "John Doe",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 "Volunteer | Supporter",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),

//           /// 🔹 Stats Row (Saved Posts, Supported NGOs)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildStatCard("Saved Posts", "15"),
//                 _buildStatCard("Supported NGOs", "08"),
//                 _buildStatCard("Donations", "₹1200"),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// 🔹 Options List
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _buildProfileOption(
//                   icon: Icons.edit,
//                   title: "Edit Profile",
//                   onTap: () {},
//                 ),
//                 _buildProfileOption(
//                   icon: Icons.history,
//                   title: "Transaction History",
//                   onTap: () {},
//                 ),
//                 _buildProfileOption(
//                   icon: Icons.bookmark,
//                   title: "My Saved Posts",
//                   onTap: () {},
//                 ),
//                 _buildProfileOption(
//                   icon: Icons.favorite,
//                   title: "NGOs I Support",
//                   onTap: () {},
//                 ),
//                 _buildProfileOption(
//                   icon: Icons.logout,
//                   title: "Logout",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// 🔹 Small Stat Card Widget
//   Widget _buildStatCard(String title, String value) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }

//   /// 🔹 Reusable Profile Option Tile
//   Widget _buildProfileOption({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               colors: [AppColors.primaryPink, AppColors.orange],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Icon(icon, color: Colors.white, size: 22),
//         ),
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//         onTap: onTap,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          /// 🔹 Gradient Header
          Container(
            height: 160,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryPink, AppColors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                /// Back button + Title (LEFT aligned)
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                /// 🔹 Profile Image (CENTER, overlapping bottom)
                Positioned(
                  bottom: -50,
                  left: (screenWidth / 2) - (screenWidth * 0.18),
                  child: CircleAvatar(
                    radius: screenWidth * 0.18,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: screenWidth * 0.16,
                      backgroundImage: const NetworkImage(
                        "https://i.pravatar.cc/300?img=15",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 Body
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
              child: Column(
                children: [
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Volunteer | Supporter",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard("Saved Posts", "15"),
                      _buildStatCard("Supported NGOs", "08"),
                      _buildStatCard("Donations", "₹1200"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 Options
                  _buildProfileOption(
                    icon: Icons.edit,
                    title: "Edit Profile",
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.bookmark,
                    title: "My Saved Posts",
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.favorite,
                    title: "NGOs I Support",
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.history,
                    title: "Transaction History",
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    icon: Icons.logout,
                    title: "Logout",
                    onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Stat card widget
  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  /// 🔹 Profile option tile
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryPink),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
