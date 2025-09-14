import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kindify_app/services/api_client.dart';
import 'package:kindify_app/services/token_storage.dart';
import '../model/post.dart';

class PostRepository {

  final ApiClientService _apiClient = ApiClientService();

  Future<List<Post>> fetchPosts({int page = 1, int limit = 10}) async {
    final token = await TokenStorageService.getToken();
    //debugPrint("Toksss: $token");
    //debugPrint("Toksss: ${TokenStorageService.getToken().toString()}");
    final response = await _apiClient.get(
      "/api/posts",
      params: {"page": "$page", "limit": "$limit"},
    );

    //debugPrint("In Fetch:- ${response}");

    //debugPrint("🔹 Status: ${response.statusCode}");
    //debugPrint("🔹 Body: ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] == true && data['posts'] != null) {
        final postsJson = data['posts'] as List;
        return postsJson.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception("API responded with success=false or no posts");
      }
    } else if (response.statusCode == 401) {
      throw Exception("Unauthorized! Please login again.");
    } else {
      throw Exception("Failed to load posts: ${response.statusCode}");
    }
  }
}