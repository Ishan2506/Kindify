import 'package:flutter/material.dart';
import 'package:kindify_app/api/post_repository.dart';
import 'package:kindify_app/model/post.dart';
import 'package:kindify_app/model/story.dart';
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/category/categoryPage.dart';
import 'package:kindify_app/views/home/custom_drawer.dart';
import 'package:kindify_app/views/home/donation_card.dart';
import 'package:kindify_app/views/widgets/story_widget.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final List<String> carouselImages = [
    // "https://picsum.photos/400/200",
    // "https://picsum.photos/401/200",
    "https://picsum.photos/402/200",
  ];
  int _selectedIndex = 0;

  void _loadStories() {
  // Add your stories data here
  stories.addAll([
    Story(
      id: '1',
      title: 'Annpurana',
      location: 'Gujarat',
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.AzWibJ8rpKmJVPgazO8TLAHaEo?rs=1&pid=ImgDetMain&o=7&rm=3', 
    ),
    Story(
      id: '2',
      title: 'Food Drive',
      location: 'Mumbai',
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.AzWibJ8rpKmJVPgazO8TLAHaEo?rs=1&pid=ImgDetMain&o=7&rm=3',
    ),
    Story(
      id: '3',
      title: 'Clothes Donation',
      location: 'Delhi',
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.AzWibJ8rpKmJVPgazO8TLAHaEo?rs=1&pid=ImgDetMain&o=7&rm=3',
    ),
       Story(
      id: '4',
      title: 'Clothes Donation',
      location: 'Delhi',
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.AzWibJ8rpKmJVPgazO8TLAHaEo?rs=1&pid=ImgDetMain&o=7&rm=3',
    ),
       Story(
      id: '5',
      title: 'Clothes Donation',
      location: 'Delhi',
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.AzWibJ8rpKmJVPgazO8TLAHaEo?rs=1&pid=ImgDetMain&o=7&rm=3',
    ),
       Story(
      id: '6',
      title: 'Clothes Donation',
      location: 'Delhi',
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.AzWibJ8rpKmJVPgazO8TLAHaEo?rs=1&pid=ImgDetMain&o=7&rm=3',
    ),
       Story(
      id: '7',
      title: 'Clothes Donation',
      location: 'Delhi',
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.AzWibJ8rpKmJVPgazO8TLAHaEo?rs=1&pid=ImgDetMain&o=7&rm=3',
    ),

    // Add more stories as needed
  ]);
}


late Future<List<Post>> futurePosts;
final List<Story> stories = []; 
@override
void initState() {
  super.initState();
  futurePosts = PostRepository().fetchPosts();
  _loadStories();
}

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

      body: FutureBuilder<List<Post>>(
      future: futurePosts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final posts = snapshot.data!;
        
        return CustomScrollView(
          slivers: [
              SliverToBoxAdapter(
                child: StorySection(stories: stories),
              ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final post = posts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: DonationCard(
                      title: post.name,
                      location: post.location,
                      imageAsset: 'https://kindify-backend.onrender.com${post.picture}',
                    ),
                  );
                },
                childCount: posts.length,
              ),
            ),
          ],
        );
      },
    ),

      // 🔹 Gradient Bottom Navigation Bar
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 86,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              const itemCount = 4;
              const notchDiameter = 56.0; // white cutout circle size
              final slot = width / itemCount;
              final notchLeft =
                  _selectedIndex * slot + slot / 2 - notchDiameter / 2;

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
                        color: Theme.of(
                          context,
                        ).scaffoldBackgroundColor, // usually white
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
                              if (i == 3) {
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>  CategoryPage(), // replace with your login widget
                                      ),
                                );
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



