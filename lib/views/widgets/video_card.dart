import 'package:flutter/material.dart';
import 'package:video_task/utils/utils.dart';

import '../../data/models/video.dart';

class VideoCard extends StatelessWidget {
  // final String thambnail;
  // final String duration;
  // final String channel_image;
  // final String viewers;
  // final String title;
  final Results video;
  final void Function() onTap;
  const VideoCard(
      {super.key,
      // required this.thambnail,
      // required this.duration,
      // required this.channel_image,
      // required this.viewers,
      // required this.title,
      required this.video,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: onTap,
                child: Image.network(
                  video.thumbnail ?? "",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Text(
                  video.duration ?? "0.00",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        backgroundColor: Colors.black.withOpacity(.7),
                      ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(video.channelImage ?? ""),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              video.title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 15.0),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, top: 8),
                          child: Text(
                            CustomUtils.addStringViews(
                                video.viewers ?? "", video.createdAt ?? ""),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
