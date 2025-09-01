// model/save_post.dart
class SavedPost {
  final String id;
  final String postId;
  final String userId;
  final DateTime savedAt;

  SavedPost({
    required this.id,
    required this.postId,
    required this.userId,
    required this.savedAt,
  });

  factory SavedPost.fromJson(Map<String, dynamic> json) {
    return SavedPost(
      id: json['_id'] ?? json['id'] ?? '',
      postId: json['postId'] ?? '',
      userId: json['userId'] ?? '',
      savedAt: json['savedAt'] != null 
          ? DateTime.parse(json['savedAt'].toString())
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
    };
  }
}