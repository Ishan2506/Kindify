class Post {
  final String id;
  final String name;
  final String location;
  final String picture;
  final List<String> likedBy;

  Post({
    required this.id,
    required this.name,
    required this.location,
    required this.picture,
    required this.likedBy,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["_id"] as String,
      name: json["name"] ?? "",
      location: json["location"] ?? "",
      picture: json["picture"] ?? "",
      likedBy: (json["likedBy"] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }
}
