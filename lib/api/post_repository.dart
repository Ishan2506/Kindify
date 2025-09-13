import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:kindify_app/services/token_storage.dart';
import '../model/post.dart';

class PostRepository {
  static const String baseUrl = 'https://kindify-backend.onrender.com/api';

  Future<List<Post>> fetchPosts({int page = 1, int limit = 10}) async {
    // Get the token from storage
    // final String? token = await TokenStorageService.getToken();
    final String? token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWY2YjgxYjMzOTM1YWNmYWY5NmVhMSIsImVtYWlsIjoiZGV2c2hhaDEyMDkwMkBnbWFpbC5jb20iLCJyb2xlIjoiVXNlciIsImlhdCI6MTc1NjU3MzU1MywiZXhwIjoxNzU3MTc4MzUzfQ.vXzxz0k-KAotT7s-30xINyXh913zTWGlumULlhuli44';
    
    // Prepare headers
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    
    // Add Authorization header if token exists
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    final response = await http.get(
      Uri.parse('$baseUrl/posts?page=$page&limit=$limit'),
      headers: headers,
    );
    
    log('Status Code: ${response.statusCode}');
    log('Response: ${response.body}');
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final postsJson = data['posts'] as List;
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      // Handle unauthorized access (token expired or invalid)
      throw Exception('Unauthorized access. Please login again.');
    } else {
      throw Exception('Failed to load posts');
    }
  }
}