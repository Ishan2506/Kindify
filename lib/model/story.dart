// model/story.dart
class Story {
  final String id;
  final String title;
  final String location;
  final String imageUrl;
  final bool isUserStory;
  final String? username;
  final String? email;
  final DateTime? createdAt;

  Story({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrl,
    this.isUserStory = false,
    this.username,
    this.email,
    this.createdAt,
  });

 // model/story.dart
factory Story.fromJson(Map<String, dynamic> json) {
  return Story(
    id: json['id']?.toString() ?? '',
    title: json['title']?.toString() ?? '',
    location: json['location']?.toString() ?? '',
    imageUrl: json['imageUrl']?.toString() ?? '',
    isUserStory: json['isUserStory'] ?? false,
    username: json['createdBy'] != null ? (json['createdBy'] as Map<String, dynamic>)['username']?.toString() : null,
    email: json['createdBy'] != null ? (json['createdBy'] as Map<String, dynamic>)['email']?.toString() : null,
    createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'].toString()) : null,
  );
}
}