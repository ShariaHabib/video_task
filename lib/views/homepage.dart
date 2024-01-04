import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_task/views/widgets/video_card.dart';
import '../data/models/video.dart';
import 'cubit/video_player_cubit.dart';
import 'cubit/video_player_state.dart';
import 'video_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  List<Results> videos = [];
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    BlocProvider.of<VideoPlayerCubit>(context).loadVideos();
    scrollFunction(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollFunction(context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        if (!BlocProvider.of<VideoPlayerCubit>(context).state.isLoading) {
          BlocProvider.of<VideoPlayerCubit>(context).loadVideos();
          print("EITO BABA LAST");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    scrollFunction(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Trending videos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
                  builder: (context, state) {
                    if (state is VideoPlayerInitial) {
                      return Text("INITIAL data");
                    } else if (state is VideoPlayerLoading) {
                      return _loadingIndicator();
                    } else if (state is VideoPlayerLoaded) {
                      var x = state.videoList.results ?? [];
                      videos.addAll(x);
                      return ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(8),
                        itemCount: videos.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < videos.length) {
                            print(index);
                            return Column(
                              children: [
                                SingleChildScrollView(
                                  child: Center(
                                    child: VideoCard(
                                      video: videos[index],
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => VideoDetails(
                                                video: videos[index]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return _loadingIndicator();
                          }
                        },
                      );
                    } else if (state is VideoPlayerError) {
                      print(state.message);
                      return Text(state.message);
                    } else {
                      return Text("data");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _loadingIndicator() {
  Future.delayed(Duration(seconds: 1));
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: CircularProgressIndicator()),
  );
}
