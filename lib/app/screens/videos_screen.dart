import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spelling_bee/app/screens/video_player.dart';

import '../models/videos_list.dart';
import '../utilities/services.dart';
import '../widgets/page_header.dart';

class VideosScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  VideosScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late VideosList _videosList;
  late bool _isLoadingVideos;
  late String _nextPageToken;
  double offset = 0;

  @override
  void initState() {
    _isLoadingVideos = true;
    _nextPageToken = '';
    _loadVideos();
    super.initState();
  }

  _loadVideos() async {
    VideosList temVideosList = await Services.getVideosList(
      playListId: 'PLuYj4Im3PAjWPOBLnzv9J0U5LrMur4qfU',
      pageToken: _nextPageToken,
    );
    _nextPageToken = temVideosList.nextPageToken;
    _videosList = VideosList(
        kind: '',
        etag: '',
        nextPageToken: temVideosList.nextPageToken,
        videos: temVideosList.videos,
        pageInfo: temVideosList.pageInfo);
    setState(() {
      _isLoadingVideos = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoadingVideos
          ? Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: PageHeader(
                    title: widget.title,
                    primaryColor: widget.primaryColor,
                    secondaryColor: widget.secondaryColor,
                    offset: offset,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      VideoItem videoItem = _videosList.videos[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VideoPlayer(videoItem: videoItem);
                            }));
                          },
                          child: Container(
                            height: 300,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        videoItem.video.thumbnails.high.url,
                                  ),
                                ),
                                // Flexible(child: Text(videoItem.video.title)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: _videosList.videos.length, // 1000 list items
                  ),
                ),
              ],
            ),
    );
  }
}
