class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;
  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
  });

  factory Video.fromMap(Map<String, dynamic> snipet) {
    return Video(
      id: snipet['resourceId']['videoId'],
      title: snipet['title'],
      thumbnailUrl: snipet['thumbnails']['high']['url'],
      channelTitle: snipet['channelTitle'],
    );
  }
}
