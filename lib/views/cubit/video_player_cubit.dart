import 'package:bloc/bloc.dart';

import '../../data/models/video.dart';
import '../../data/services/video_services.dart';
import 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  Video? videoList;
  VideoService apiService;
  VideoPlayerCubit({this.videoList, required this.apiService})
      : super(VideoPlayerInitial());
  int currentPage = 1;
  List<Results>? old = [];
  void loadVideos() async {
    try {
      if (currentPage == 1) emit(const VideoPlayerLoading());
      videoList = await apiService.fetchVideo(currentPage);
      emit(VideoPlayerLoaded(
        videoList: videoList ?? Video(),
      ));
      old = (state as VideoPlayerLoaded).videoList.results;
      if (!apiService.isFinished) currentPage++;
    } on Exception catch (e) {
      emit(VideoPlayerError(message: e.toString()));
    }
  }
}
