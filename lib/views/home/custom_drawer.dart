import 'package:flutter/material.dart';
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/Profile/profile.dart';
import 'package:kindify_app/views/home_drawer/aboutkindify_page.dart';
import 'package:kindify_app/views/home_drawer/contactwithus_page.dart';
import 'package:kindify_app/views/home_drawer/helpsupport_page.dart';
import 'package:kindify_app/views/home_drawer/join_volunteer_screen.dart';
import 'package:kindify_app/views/login/login_screen.dart';
import 'package:kindify_app/views/request/request_select_date.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismiss on outside tap
    builder: (context) {
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: width * 0.8, // 80% of screen width
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min, // fit content
            children: [
              // 🔹 Title
              Text(
                "Confirm Logout",
                style: TextStyle(
                  fontSize: width * 0.05, // responsive font
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),

              // 🔹 Message
              Text(
                "Are you sure you want to logout?",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.03),

              // 🔹 Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ❌ No Button
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryPink, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: height * 0.018),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: AppColors.primaryPink,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),

                  // ✅ Yes Button (Gradient)
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primaryPink, AppColors.orange],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.018),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pop(context); // close dialog
                          await TokenStorageService.clearToken();

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


void _shareApp() {
  const appLink =
      "https://play.google.com/store/apps/details?id=com.pubg.imobile";

  Share.share(
    "Check out this amazing app Kindify! Download here: $appLink",
    subject: "Kindify App",
  );
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // 🔹 Fixed Top Options Container
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryPink, AppColors.orange],
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.arrow_back, color: Colors.white),
              title: Text(
                "Options",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
          ),

          // 🔹 Scrollable Middle Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ListTile(
                  //   leading: Icon(Icons.person),
                  //   title: Text("Profile"),
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => ProfileScreenWithTabs(),
                  //       ),
                  //     );
                  //   },
                  // ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text("Total Donation"),
                    onTap: () {
                      print("Total Donation clicked");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About Kindify"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutKindifyPage(),
                        ),
                      );
                    },
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.feedback),
                  //   title: Text("Feedback"),
                  //   onTap: () {
                  //     print("Feedback clicked");
                  //   },
                  // ),
                  ListTile(
                    leading: Icon(Icons.edit_calendar),
                    title: Text("Request"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestSelectDate(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text("Connect with Us"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactWithUsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group_add),
                    title: Text("Join as a Volunteer"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JoinVolunteerScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.handshake),
                    title: Text("Partner with Us"),
                    onTap: () {
                      print("Partner with Us clicked");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.support_agent),
                    title: Text("Help & Support"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpSupportPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Share App"),
                    onTap: () {
                      Navigator.pop(context);
                      _shareApp();
                    },
                  ),

                  // 🔹 Add spacing before logout
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // 🔹 Fixed Logout Button (always bottom)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryPink, AppColors.orange],
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text("Logout", style: TextStyle(color: Colors.white)),
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
