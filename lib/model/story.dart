class Story {
  final String id;
  final String title;
  final String location;
  final String imageUrl;
  final bool isUserStory;

  Story({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrl,
    this.isUserStory = false,
  });
}