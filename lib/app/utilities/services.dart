import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/channel_info.dart';
import '../models/videos_list.dart';
import 'Constants.dart';

class Services {
  static const CHANNEL_ID = 'UCDYeMRs7NM2jjKpIoNENKpQ';
  static const _baseUrl = 'youtube.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': API_KEY,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );

    Response response = await http.get(uri, headers: headers);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideosList> getVideosList(
      {required String playListId, required String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '20',
      'pageToken': pageToken,
      'key': API_KEY,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );

    Response response = await http.get(uri, headers: headers);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}
