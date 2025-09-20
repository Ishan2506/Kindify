class Post {
  final String id;
  final String name;
  final String location;
  final String picture;
  final List<String> likedBy;
  final List<String> savedBy;
  final int totalLikes;
  final int totalSaves;

  Post({
    required this.id,
    required this.name,
    required this.location,
    required this.picture,
    required this.likedBy,
    required this.savedBy,
    required this.totalLikes,
    required this.totalSaves,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      picture: json['picture'] ?? '',
      likedBy: (json['likedBy'] as List<dynamic>?)
              ?.map((e) => e['_id'] as String)
              .toList() ??
          [],
      savedBy: (json['savedBy'] as List<dynamic>?)
              ?.map((e) => e['_id'] as String)
              .toList() ??
          [],
      totalLikes: json['totalLikes'] ?? 0,
      totalSaves: json['totalSaves'] ?? 0,
    );
  }
  /// Check if current user liked this post
  bool isLikedByUser(String? userId) {
    return likedBy.contains(userId);
  }
}
