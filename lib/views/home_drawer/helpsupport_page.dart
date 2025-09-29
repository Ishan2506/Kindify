// import 'package:flutter/material.dart';
// import 'package:kindify_app/services/toast_service.dart';
//
// import 'package:kindify_app/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class HelpSupportPage extends StatefulWidget {
//   const HelpSupportPage({super.key});
//
//
//   @override
//   State<HelpSupportPage> createState() => _HelpSupportPageState();
//
//   static Widget _buildFAQTile(String question, String answer) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 3,
//       color: AppColors.primaryPink,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: ExpansionTile(
//         iconColor: Colors.white,
//         collapsedIconColor: Colors.white,
//         title: Text(
//           question,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               answer,
//               style: const TextStyle(fontSize: 15, color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   static Widget _buildGuideStep(
//     String title, String description, IconData icon, Color color) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 8),
//     child: Material(
//       elevation: 4,
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             colors: [AppColors.primaryPink.withOpacity(0.1), AppColors.orange.withOpacity(0.1)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Icon with circular background
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [AppColors.primaryPink, AppColors.orange],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               padding: const EdgeInsets.all(14),
//               child: Icon(
//                 icon,
//                 color: Colors.white,
//                 size: 28,
//               ),
//             ),
//
//             const SizedBox(width: 16),
//
//             // Texts
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     description,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.black54,
//                       height: 1.4,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
//
//   static _buildSocialIcon({
//     required IconData icon,
//     required Color color,
//     required VoidCallback onTap,}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: color.withOpacity(0.1),
//         ),
//         child: Icon(
//           icon,
//           size: 32,
//           color: color,
//         ),
//       )
//     );
//   }
// }
//
// class _HelpSupportPageState extends State<HelpSupportPage> {
//   void _openUrl(String url) async {
//   final uri = Uri.parse(url);
//
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     ToastService.showError(context, "Cannot open this link");
//   }
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [AppColors.primaryPink, AppColors.orange],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//               child: ListTile(
//                 leading: IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: const Icon(Icons.arrow_back, color: Colors.white),
//                 ),
//                 title: const Text(
//                   "Help & Support",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 12,),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "FAQs",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primaryPink,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//
//                     HelpSupportPage._buildFAQTile(
//                       "How do I create an account as a user?",
//                       "You can easily create an account by signing up with your email. Once registered, verify your account to get started.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "How do I create an account as a Trust?",
//                       "First, register yourself on Kindify. Then, provide your Darpan ID for verification. Once our technical team verifies the details, you will be granted access to use the application as a Trust.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "How can I request a donation?",
//                       "To request a donation, simply fill out the request form with the category, your address, and upload proof if required.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "What is the purpose of categories?",
//                       "Categories help you directly connect with the right Trusts. By selecting a category, you can quickly find and donate to causes that matter most to you.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "How do I make a donation through Kindify?",
//                       "Just browse through the post, select a cause you wish to support, and click Donate Now to complete your contribution.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "How can I join a Trust as a volunteer?",
//                       "Choose your preferred days and time slots, register as a volunteer, and the respective Trust will contact you directly.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "How do I partner with Kindify?",
//                       "Fill in your email ID and basic details, and our team will reach out to you with the next steps to become a partner.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "Is my donation secure?",
//                       "Absolutely. All donations are processed through encrypted and trusted payment gateways, ensuring complete safety and transparency.",
//                     ),
//                     HelpSupportPage._buildFAQTile(
//                       "How can I contact support?",
//                       "For assistance, you can reach us anytime at support@kindify.com",
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     Text(
//                       "How to Use Kindify",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primaryPink,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//
//                     HelpSupportPage._buildGuideStep(
//                       "Step 1: Sign In",
//                       "Log in to your account using your registered email and password.",
//                       Icons.login,
//                       AppColors.orange,
//                     ),
//                     HelpSupportPage._buildGuideStep(
//                       "Step 2: Verify Account",
//                       "Complete the verification process to unlock all features of Kindify.",
//                       Icons.verified_user,
//                       AppColors.primaryPink,
//                     ),
//                     HelpSupportPage._buildGuideStep(
//                       "Step 3: Explore Posts",
//                       "Browse donation posts shared by Trusts and individuals in need.",
//                       Icons.view_list,
//                       AppColors.orange,
//                     ),
//                     HelpSupportPage._buildGuideStep(
//                       "Step 4: Donate from Post",
//                       "Click on the Donate Now button on the post you want to support.",
//                       Icons.volunteer_activism,
//                       AppColors.primaryPink,
//                     ),
//                     HelpSupportPage._buildGuideStep(
//                       "Step 5: Donate via Category Page",
//                       "Use the Category Page to browse categories and donate directly to a Trust.",
//                       Icons.category,
//                       AppColors.orange,
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     Text(
//                       "Contact Us",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primaryPink,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     GestureDetector(
//                       onTap: () async {
//                         const email = 'ishantrivedi092@gmail.com';
//                         final uri = Uri(
//                           scheme: 'mailto',
//                           path: 'support@kindify.com',
//                           queryParameters: {
//                             'subject': 'Support Request',
//                             // Leave 'body' empty, so user can write.
//                           },
//                         );
//
//                         if (await canLaunchUrl(uri)) {
//                           await launchUrl(uri);
//                         } else {
//                           // Show a friendly error message
//                           ToastService.showError(context, "No email app installed on this device");
//                         }
//                       },
//                       child: const Text(
//                         "📧 support@kindify.com",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: AppColors.primaryPink,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     Text(
//                       "Community & Social Links",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primaryPink,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             HelpSupportPage._buildSocialIcon(
//                               icon: Icons.facebook,
//                               color: Color(0xFF1877F2),  // Facebook Blue
//                               onTap: () => null,
//                             ),
//                             SizedBox(width: 20),
//
//                             HelpSupportPage._buildSocialIcon(
//                               icon: Icons.link,
//                               color: Colors.blueAccent,
//                               onTap: () => null,
//                             ),
//                             SizedBox(width: 20),
//
//                             HelpSupportPage._buildSocialIcon(
//                               icon: Icons.camera_alt,
//                               color: Color(0xFFC13584),  // Instagram gradient start color
//                               onTap: () => _openUrl('https://www.instagram.com/_.devarshhhh._?igsh=czlkbDZzbTBiMzd1'),
//                             ),
//                             SizedBox(width: 20),
//
//                             HelpSupportPage._buildSocialIcon(
//                               icon: Icons.alternate_email,
//                               color: Colors.lightBlue,
//                               onTap: () => null,
//                             ),
//                           ],
//                         ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:kindify_app/services/toast_service.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();

  // 🔹 FAQ Tile (compact)
  static Widget _buildFAQTile(String question, String answer) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      color: AppColors.primaryPink,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Guide Step (compact)
  static Widget _buildGuideStep(
      String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                AppColors.primaryPink.withOpacity(0.08),
                AppColors.orange.withOpacity(0.08)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon with circular background
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.primaryPink, AppColors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.3,
                      ),
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

  // 🔹 Social Icon (compact)
  static Widget _buildSocialIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.12),
        ),
        child: Icon(icon, size: 22, color: color),
      ),
    );
  }
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  void _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ToastService.showError(context, "Cannot open this link");
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        children: [
          // 🔹 Top Bar
          Container(
            padding: EdgeInsets.only(top: paddingTop),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryPink, AppColors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: ListTile(
              dense: true,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              ),
              title: const Text(
                "Help & Support",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 🔹 Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("FAQs"),
                  HelpSupportPage._buildFAQTile(
                    "How do I create an account as a user?",
                    "You can create an account by signing up with your email. Once registered, verify your account to get started.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "How do I create an account as a Trust?",
                    "Register on Kindify, then provide your Darpan ID for verification. Once verified, you will get Trust access.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "How can I request a donation?",
                    "Fill out the donation request form with category, address, and upload proof if required.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "What is the purpose of categories?",
                    "Categories connect you with the right Trusts for quicker donations.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "How do I make a donation?",
                    "Browse posts, choose a cause, and click Donate Now to complete your contribution.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "How can I join as a volunteer?",
                    "Select your availability and register. The Trust will contact you.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "How do I partner with Kindify?",
                    "Submit your email and details, and our team will reach out to you.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "Is my donation secure?",
                    "Yes. All donations are processed through encrypted and trusted gateways.",
                  ),
                  HelpSupportPage._buildFAQTile(
                    "How can I contact support?",
                    "You can reach us anytime at support@kindify.com",
                  ),

                  const SizedBox(height: 20),
                  _buildSectionTitle("How to Use Kindify"),
                  HelpSupportPage._buildGuideStep(
                    "Step 1: Sign In",
                    "Log in with your registered email and password.",
                    Icons.login,
                    AppColors.orange,
                  ),
                  HelpSupportPage._buildGuideStep(
                    "Step 2: Verify Account",
                    "Complete verification to unlock all features.",
                    Icons.verified_user,
                    AppColors.primaryPink,
                  ),
                  HelpSupportPage._buildGuideStep(
                    "Step 3: Explore Posts",
                    "Browse donation posts shared by Trusts and individuals.",
                    Icons.view_list,
                    AppColors.orange,
                  ),
                  HelpSupportPage._buildGuideStep(
                    "Step 4: Donate from Post",
                    "Click Donate Now on the post you want to support.",
                    Icons.volunteer_activism,
                    AppColors.primaryPink,
                  ),
                  HelpSupportPage._buildGuideStep(
                    "Step 5: Donate via Category Page",
                    "Browse categories and donate directly to a Trust.",
                    Icons.category,
                    AppColors.orange,
                  ),

                  const SizedBox(height: 20),
                  _buildSectionTitle("Contact Us"),
                  GestureDetector(
                    onTap: () async {
                      final uri = Uri(
                        scheme: 'mailto',
                        path: 'support@kindify.com',
                        queryParameters: {'subject': 'Support Request'},
                      );
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      } else {
                        ToastService.showError(context, "No email app installed");
                      }
                    },
                    child: const Text(
                      "📧 support@kindify.com",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryPink,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  _buildSectionTitle("Community & Social Links"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HelpSupportPage._buildSocialIcon(
                        icon: Icons.facebook,
                        color: Color(0xFF1877F2),
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      HelpSupportPage._buildSocialIcon(
                        icon: Icons.link,
                        color: Colors.blueAccent,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      HelpSupportPage._buildSocialIcon(
                        icon: Icons.camera_alt,
                        color: Color(0xFFC13584),
                        onTap: () => _openUrl('https://www.instagram.com/_.devarshhhh._'),
                      ),
                      const SizedBox(width: 16),
                      HelpSupportPage._buildSocialIcon(
                        icon: Icons.alternate_email,
                        color: Colors.lightBlue,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Reusable Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryPink,
      ),
    );
  }
}
