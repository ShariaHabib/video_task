import '../models/video.dart';
import '../services/video_services.dart';

class VideosRepository {
  final VideoService service;

  VideosRepository(this.service);

  Future<List<Results>> fetchVideos(int page) async {
    final videos = await service.fetchVideo(page);
    return videos.results!.toList();
  }
}
