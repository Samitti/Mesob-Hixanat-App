class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  factory Video.fromMap(Map<String, dynamic> element) {
    return Video(
      id: element['id']['videoId'],
      title: element['snippet']['title'],
      thumbnailUrl: element['snippet']['thumbnails']['default']['url'],
    );
  }
}
