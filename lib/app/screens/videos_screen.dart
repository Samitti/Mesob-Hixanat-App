import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spelling_bee/app/controllers/color_controller.dart';
import 'package:spelling_bee/app/models/channel_model.dart';
import 'package:spelling_bee/app/screens/colors_screen.dart';
import 'package:spelling_bee/app/screens/game_screen.dart';
import 'package:spelling_bee/app/screens/letters_screen.dart';
import 'package:spelling_bee/app/screens/shapes_screen.dart';
import 'package:spelling_bee/app/screens/words_screen.dart';
import 'package:spelling_bee/app/utilities/keys.dart';
import 'package:spelling_bee/app/widgets/category_card.dart';

import '../models/video_model.dart';
import 'numbers_screen.dart';
import 'package:http/http.dart' as http;

class VideosScreen extends StatefulWidget {
  // final String title;
  // final Color primaryColor;
  // final Color secondaryColor;
  const VideosScreen({
    Key? key,
    // required this.title,
    // required this.primaryColor,
    // required this.secondaryColor,
  }) : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  var _data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    const apiKey = API_KEY;

    final queryParameters = {
      'part': 'snippet',
      'key': apiKey,
      'channelId': 'UCDYeMRs7NM2jjKpIoNENKpQ',
      'maxResults': '50',
    };

    final uri =
        Uri.https('www.googleapis.com', '/youtube/v3/search', queryParameters);
    final response = await http.get(uri);
    final List<dynamic> loadedOrdersVideos = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(
      extractedData['items'][0],
    );
    setState(() {
      _data = extractedData['items'];
    });
  }

  _buildVideo(Video video) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      height: 140,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
          blurRadius: 6.0,
        )
      ]),
      child: Row(
        children: <Widget>[
          Image(
            width: 150.0,
            image: NetworkImage(video.thumbnailUrl),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              video.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesob Hixanat Channel'),
      ),
      body: _data != null
          ? ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                Video video = Video(
                  id: _data[index]['id']['videoId'],
                  title: _data[index]['snippet']['title'],
                  thumbnailUrl: _data[index]['snippet']['thumbnails']['high']
                      ['url'],
                  channelTitle: _data[index]['snippet']['channelTitle'],
                );
                return _buildVideo(video);
              },
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
    );
  }
}
