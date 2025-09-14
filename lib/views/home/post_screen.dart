import 'package:flutter/material.dart';
import 'package:kindify_app/api/post_repository.dart';
import 'package:kindify_app/api/story_repository.dart';
import 'package:kindify_app/model/post.dart';
import 'package:kindify_app/model/story.dart';
import 'package:kindify_app/services/api_client.dart';
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/category/categoryPage.dart';
import 'package:kindify_app/views/home/custom_drawer.dart';
import 'package:kindify_app/views/home/donation_card.dart';
import 'package:kindify_app/views/widgets/story_widget.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key:key);
  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  final List<String> carouselImages = [
    "https://picsum.photos/402/200",
  ];
  int _selectedIndex = 0;

  late Future<List<Post>> futurePosts;
  late Future<List<Story>> futureStories;
  
  @override
  void initState() {
    super.initState();
    try{

    futurePosts = PostRepository().fetchPosts();
    debugPrint("Token in Post:- ${TokenStorageService.getToken()}");
    debugPrint("abcd: ${futurePosts.toString()}");
    }catch(e)
    {
      debugPrint("Error:-- ${e}");
    }
    futureStories = StoryRepository().fetchStories();
  }

  void _refreshData() {
    setState(() {
      futurePosts = PostRepository().fetchPosts();
      futureStories = StoryRepository().fetchStories();
    });
  }
    void refresh() {
    setState(() {
      futurePosts = PostRepository().fetchPosts();
      futureStories = StoryRepository().fetchStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              imageAsset: 'https://kindify-backend-zspk.onrender.com${post.picture}',
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
                              imageAsset: 'https://kindify-backend-zspk.onrender.com${post.picture}',
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
                              imageAsset: 'https://kindify-backend-zspk.onrender.com${post.picture}',
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
    );
  }
}
