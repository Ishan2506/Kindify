import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/home/custom_drawer.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final List<String> carouselImages = [
    "https://picsum.photos/400/200",
    "https://picsum.photos/401/200",
    "https://picsum.photos/402/200",
  ];
  int _selectedIndex=0;
  
  // final List<Map<String, String>> posts = [
  //   {
  //     "name": "Annupurna food donation",
  //     "location": "Gujarat",
  //     "image": "https://picsum.photos/300/200",
  //   },
  //   {
  //     "name": "Maruti donation",
  //     "location": "Surat",
  //     "image": "https://picsum.photos/301/200",
  //   },
  // ];
  List<Map<String, dynamic>> posts = [
  {"name": "Annupurna food donation", "location": "Gujarat", "image": "https://picsum.photos/300/200", "isLiked": false, "likes": 120},
  {"name": "Maruti donation", "location": "Surat", "image": "https://picsum.photos/301/200", "isLiked": false, "likes": 90},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),

      // 🔹 Gradient AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryPink, AppColors.orange],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Container(
          height: 42,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search, color: Colors.grey, size: 26),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Carousel Slider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 160,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: carouselImages.map((imgUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(imgUrl, fit: BoxFit.cover, width: 1000),
                  );
                }).toList(),
              ),
            ),

            // 🔹 Posts List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trust Info
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage("https://picsum.photos/50"),
                        ),
                        title: Text(post["name"]!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        subtitle: Text(post["location"]!),
                        trailing: Text(
                          "Support+",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Post Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          post["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),

                      // Buttons
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: post["isLiked"]
                                  ? const Icon(Icons.favorite,size: 30,color: Colors.redAccent,)
                                  : const Icon(Icons.favorite_border,size: 30,color: Colors.grey,),
                                  onPressed: (){
                                    setState(() {
                                      post["isLiked"] = !post["isLiked"];
                                      post["isLiked"]
                                          ? post["likes"]++
                                          : post["likes"]--;
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.send,
                                      size: 30, color: Colors.grey[700]),
                                  onPressed: (){},
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: Text(
                                "${post["likes"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14, 
                                  //color: [AppColors.primaryPink,AppColors.orange]
                                ),
                              ),
                            ),
                            // 🔹 Gradient Donate Button
                            Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primaryPink,
                                    AppColors.orange
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Donate Now",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // 🔹 Gradient Bottom Navigation Bar
      bottomNavigationBar: SafeArea(
  child: SizedBox(
    height: 86,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        const itemCount = 4;
        const notchDiameter = 56.0;        // white cutout circle size
        final slot = width / itemCount;
        final notchLeft = _selectedIndex * slot + slot / 2 - notchDiameter / 2;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            // Gradient background bar (slightly lowered to make room for the notch)
            Positioned.fill(
              top: 16,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryPink, AppColors.orange],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),

            // White circular "notch" that carves into the bar under the active item
            AnimatedPositioned(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOut,
              top: 0,
              left: notchLeft,
              child: Container(
                width: notchDiameter,
                height: notchDiameter,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor, // usually white
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Active bubble (smaller gradient circle with the active icon)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOut,
              top: 6,
              left: notchLeft + (notchDiameter - 44) / 2,
              child: Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.primaryPink, AppColors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  _barItems[_selectedIndex].icon,
                  color: Colors.white,
                ),
              ),
            ),

            // Tappable icons row
            Positioned.fill(
              top: 16, // align with the gradient bar
              child: Row(
                children: List.generate(itemCount, (i) {
                  final isActive = _selectedIndex == i;
                  return Expanded(
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() => _selectedIndex = i);

                        // Your existing action (example: clear token on Profile)
                        if (i == 2) {
                          await TokenStorageService.clearToken();
                          debugPrint("Profile tapped → token cleared");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Hide the static icon for the active item (the bubble shows it)
                            Opacity(
                              opacity: isActive ? 0.0 : 1.0,
                              child: Icon(
                                _barItems[i].icon,
                                size: 26,
                                color: Colors.white.withOpacity(0.85),
                              ),
                            ),
                            // (Optional) labels — keep hidden to match your mock
                            // SizedBox(height: 4),
                            // Opacity(
                            //   opacity: isActive ? 0.0 : 1.0,
                            //   child: Text(
                            //     _barItems[i].label,
                            //     style: const TextStyle(color: Colors.white70, fontSize: 11),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    ),
  ),
),

    );
  }
}

class _BarItem {
  final IconData icon;
  final String label;
  const _BarItem(this.icon, this.label);
}

final List<_BarItem> _barItems = const [
  _BarItem(Icons.home, "Home"),
  _BarItem(Icons.payment, "Donate"),
  _BarItem(Icons.person, "Profile"),
  _BarItem(Icons.menu, "Menu"),
];




// import 'package:flutter/material.dart';
// import 'package:kindify_app/utils/colors.dart';
// import 'package:kindify_app/views/home/PostService.dart';
// import 'package:kindify_app/views/home/post.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:kindify_app/views/home/post_repository.dart';

// class HomeScreens extends StatefulWidget {
//   const HomeScreens({super.key});

//   @override
//   State<HomeScreens> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreens> {
//   final PostService _postService = PostService();
//   late Future<List<Post>> _futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     _futurePosts = _postService.fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.menu, color: Colors.black, size: 28),
//           onPressed: () {},
//         ),
//         title: Container(
//           height: 40,
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: const TextField(
//             decoration: InputDecoration(
//               hintText: "Search",
//               prefixIcon: Icon(Icons.search, color: Colors.grey),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(vertical: 8),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.black, size: 28),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 🔹 Carousel (dummy imgs for now)
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 height: 150,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//               ),
//               items: [
//                 "https://placekitten.com/400/200",
//                 "https://placebear.com/400/200",
//                 "https://picsum.photos/400/200",
//               ].map((url) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(url, fit: BoxFit.cover, width: 1000),
//                 );
//               }).toList(),
//             ),
//           ),

//           // 🔹 Posts from API
//           Expanded(
//             child: FutureBuilder<List<Post>>(
//               future: _futurePosts,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text("No posts found"));
//                 }

//                 final posts = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: posts.length,
//                   itemBuilder: (context, index) {
//                     final post = posts[index];
//                     return _buildPostCard(post);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       // 🔹 Bottom Nav Bar
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [AppColors.primaryPink, AppColors.orange],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white70,
//           type: BottomNavigationBarType.fixed,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.payment, size: 28), label: "Payments"),
//             BottomNavigationBarItem(icon: Icon(Icons.person, size: 28), label: "Profile"),
//             BottomNavigationBarItem(icon: Icon(Icons.more_horiz, size: 28), label: "More"),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPostCard(Post post) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             leading: const CircleAvatar(
//               backgroundImage: AssetImage("assets/images/logo.png"), // Trust logo
//             ),
//             title: Text(post.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text(post.location),
//             trailing: Text("Support+", style: TextStyle(color: Colors.red[400])),
//           ),
//           if (post.picture.isNotEmpty)
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 "https://kindify-backend.onrender.com${post.picture}",
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 200,
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
//                 IconButton(icon: const Icon(Icons.send), onPressed: () {}),
//                 const Spacer(),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryPink,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                   ),
//                   onPressed: () {},
//                   child: const Text("Donate Now"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

