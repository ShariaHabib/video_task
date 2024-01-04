import 'package:equatable/equatable.dart';

import '../../data/models/video.dart';

abstract class VideoPlayerState extends Equatable {
  final bool isLoading;

  const VideoPlayerState({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}

class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoading extends VideoPlayerState {
  const VideoPlayerLoading() : super(isLoading: true);
}

class VideoPlayerLoaded extends VideoPlayerState {
  final Video videoList;
  VideoPlayerLoaded({required this.videoList}) : super(isLoading: false);

  @override
  List<Object?> get props => [videoList, isLoading];
}

class VideoPlayerError extends VideoPlayerState {
  final String message;

  VideoPlayerError({required this.message}) : super(isLoading: false);

  @override
  List<Object?> get props => [message, isLoading];
}

class VideoPlayerEnd extends VideoPlayerState {
  const VideoPlayerEnd() : super(isLoading: false);
}
