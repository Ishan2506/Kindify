// api/story_repository.dart
import 'dart:convert';
import 'dart:developer';
// import 'dart:log';
import 'package:http/http.dart' as http;
import 'package:kindify_app/services/token_storage.dart';
import '../model/story.dart';

class StoryRepository {
  static const String baseUrl = 'https://kindify-backend.onrender.com/api';

  Future<List<Story>> fetchStories() async {
    // Get the token from storage
    final String? token = await TokenStorageService.getToken();
    
    // Prepare headers
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    
    // Add Authorization header if token exists
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/stories'),
        headers: headers,
      );
      
      log('Stories Status Code: ${response.statusCode}');
      log('Stories Response: ${response.body}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          final storiesJson = data['stories'] as List;
          // Explicitly cast each item to Map<String, dynamic> and then to Story
          return storiesJson.map<Story>((json) => Story.fromJson(json as Map<String, dynamic>)).toList();
        } else {
          throw Exception('Failed to load stories: ${data['message']}');
        }
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized access. Please login again.');
      } else {
        throw Exception('Failed to load stories: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching stories: $e');
      throw Exception('Failed to load stories: $e');
    }
  }
}