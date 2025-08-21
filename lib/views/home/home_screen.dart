import 'package:flutter/material.dart';
import 'package:kindify_app/views/home/bottom_nav_bar.dart';
import 'package:kindify_app/views/home/donation_card.dart';
import 'package:kindify_app/views/home/post.dart';
import 'package:kindify_app/views/home/post_repository.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = PostRepository().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        title: const Text("Kindify"),
        backgroundColor: Colors.orangeAccent,
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
          debugPrint("Post:- ${posts}");
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final post = posts[index];
              return DonationCard(
                title: post.name,
                location: post.location,
                imageAsset: 'https://kindify-backend.onrender.com${post.picture}',
              );
            },
          );
        },
      ),
    );
  }
}
