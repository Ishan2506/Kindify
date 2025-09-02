import 'package:flutter/material.dart';
import 'package:kindify_app/api/post_repository.dart';
import 'package:kindify_app/api/story_repository.dart';
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
    "https://picsum.photos/402/200",
  ];
  int _selectedIndex = 0;

  late Future<List<Post>> futurePosts;
  late Future<List<Story>> futureStories;
  
  @override
  void initState() {
    super.initState();
    futurePosts = PostRepository().fetchPosts();
    futureStories = StoryRepository().fetchStories();
  }

  void _refreshData() {
    setState(() {
      futurePosts = PostRepository().fetchPosts();
      futureStories = StoryRepository().fetchStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
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
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white, size: 30),
            onPressed: _refreshData,
          ),
        ],
      ),

      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, postsSnapshot) {
          if (postsSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (postsSnapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error loading posts: ${postsSnapshot.error}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshData,
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final posts = postsSnapshot.data!;
          
          return FutureBuilder<List<Story>>(
            future: futureStories,
            builder: (context, storiesSnapshot) {
              // Show loading for stories while posts are already loaded
              if (storiesSnapshot.connectionState == ConnectionState.waiting) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 130,
                        child: Center(child: CircularProgressIndicator()),
                      ),
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
              }

              if (storiesSnapshot.hasError) {
                // Show posts even if stories fail to load
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 130,
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            'Could not load stories',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
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
              }

              final stories = storiesSnapshot.data ?? [];

              return RefreshIndicator(
                onRefresh: () async {
                  _refreshData();
                },
                child: CustomScrollView(
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
                ),
              );
            },
          );
        },
      ),

      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 86,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              const itemCount = 4;
              const notchDiameter = 56.0;
              final slot = width / itemCount;
              final notchLeft = _selectedIndex * slot + slot / 2 - notchDiameter / 2;

              return Stack(
                clipBehavior: Clip.none,
                children: [
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
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOut,
                    top: 0,
                    left: notchLeft,
                    child: Container(
                      width: notchDiameter,
                      height: notchDiameter,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
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
                  Positioned.fill(
                    top: 16,
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
                                  Opacity(
                                    opacity: isActive ? 0.0 : 1.0,
                                    child: Icon(
                                      _barItems[i].icon,
                                      size: 26,
                                      color: Colors.white.withOpacity(0.85),
                                    ),
                                  ),
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