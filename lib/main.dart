import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/models/video.dart';
import 'data/repository/video_repo.dart';
import 'data/services/video_services.dart';
import 'views/cubit/video_player_cubit.dart';
import 'views/homepage.dart';

void main() async {
  runApp(VideoPlayer(VideosRepository(VideoService())));
}

class VideoPlayer extends StatelessWidget {
  final VideosRepository repository;
  VideoPlayer(this.repository);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => VideoPlayerCubit(
                apiService: VideoService(), videoList: Video()))
      ], child: HomeView()),
    );
  }
}
