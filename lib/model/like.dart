// model/like.dart
class Like {
  final String id;
  final String postId;
  final String userId;
  final DateTime createdAt;

  Like({
    required this.id,
    required this.postId,
    required this.userId,
    required this.createdAt,
  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['_id'] ?? json['id'] ?? '',
      postId: json['postId'] ?? '',
      userId: json['userId'] ?? '',
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'].toString())
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