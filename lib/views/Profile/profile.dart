import 'package:flutter/material.dart';

class ProfileScreenWithTabs extends StatefulWidget {
  const ProfileScreenWithTabs({super.key});

  @override
  State<ProfileScreenWithTabs> createState() => _ProfileScreenWithTabsState();
}

class _ProfileScreenWithTabsState extends State<ProfileScreenWithTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Color activeColor = const Color(0xFFFB866A);
  final Color inactiveColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildTabIcon(IconData icon, bool isActive, double size) {
    return Icon(icon, color: isActive ? activeColor : inactiveColor, size: size);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gradient = const LinearGradient(
      colors: [Color(0xFFFB866A), Color(0xFFFBB040)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Gradient AppBar
            Container(
              height: size.height * 0.1,
              decoration: BoxDecoration(gradient: gradient),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                    iconSize: size.height * 0.035,
                  ),
                  SizedBox(width: size.width * 0.02),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.028,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // Profile Image & Info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: size.height * 0.05,
                    backgroundImage: const NetworkImage(
                      "https://randomuser.me/api/portraits/men/75.jpg",
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shailesh Prajapati",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.025,
                          ),
                        ),
                        SizedBox(height: size.height * 0.008),
                        Text(
                          "Gujarat",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: size.height * 0.018,
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        Text(
                          "user",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        Text(
                          "Address\nopposite apple cinema,\nmaninagar,Ahrmedabad,380008",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // Stats row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatItem(count: "3", label: "Donate", size: size),
                  StatItem(count: "10", label: "Supporters", size: size),
                  StatItem(count: "200", label: "supported", size: size),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.03),

            // Buttons Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.25,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Edit"),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Share"),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Contact"),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.04),

            // Tab Bar
            TabBar(
              controller: _tabController,
              indicatorColor: activeColor,
              indicatorWeight: 3,
              tabs: [
                Tab(icon: buildTabIcon(Icons.picture_as_pdf, _tabController.index == 0, size.height * 0.05)),
                Tab(icon: buildTabIcon(Icons.check_box, _tabController.index == 1, size.height * 0.05)),
                Tab(icon: buildTabIcon(Icons.save, _tabController.index == 2, size.height * 0.05)),
              ],
              onTap: (index) {
                setState(() {});
              },
            ),

            SizedBox(height: size.height * 0.02),

            // TabBarView with content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab 1 content: PDF icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      3,
                      (_) => Icon(Icons.picture_as_pdf, color: activeColor, size: size.height * 0.06),
                    ),
                  ),

                  // Tab 2 content: Checkbox icon center
                  Center(
                    child: Icon(Icons.check_box, color: activeColor, size: size.height * 0.06),
                  ),

                  // Tab 3 content: Save icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      3,
                      (_) => Icon(Icons.save, color: activeColor, size: size.height * 0.06),
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

class StatItem extends StatelessWidget {
  final String count;
  final String label;
  final Size size;

  const StatItem({super.key, required this.count, required this.label, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: size.height * 0.03,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFB866A),
          ),
        ),
        SizedBox(height: size.height * 0.007),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFB866A),
            fontSize: size.height * 0.018,
          ),
        )
      ],
    );
  }
}

