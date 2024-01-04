import 'dart:convert';
import 'package:http/http.dart';

import '../models/video.dart';

class VideoService {
  final baseUrl = "https://test-ximit.mahfil.net/api/trending-video/1";
  final Video vdo = Video();
  bool isFinished = false;
  Future<Video> fetchVideo(page) async {
    try {
      if (!isFinished) {
        final response = await get(Uri.parse(
            'https://test-ximit.mahfil.net/api/trending-video/1?page=$page'));
        if (response.statusCode == 200) {
          final Map<String, dynamic> data =
              json.decode(utf8.decode(response.bodyBytes));

          Video video = Video.fromJson(data);
          if (video.links?.next != null) {
          } else {
            isFinished = true;
          }
          return video;
        } else {
          throw Exception("Ups!! Something gone wrong from api");
        }
      } else {
        throw Exception("Ups!! Something gone wrong");
      }
    } catch (err) {
      return Video();
    }
  }
}
