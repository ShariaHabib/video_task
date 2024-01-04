import 'package:flutter/material.dart';
import 'package:video_task/utils/utils.dart';
import 'package:video_task/views/widgets/constants.dart';
import 'package:video_task/views/widgets/custom_button.dart';
import 'package:video_task/views/widgets/video_play_page.dart';

import '../data/models/video.dart';

class VideoDetails extends StatefulWidget {
  VideoDetails({Key? key, required this.video}) : super(key: key);
  final Results video;
  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          VideoPlay(
              videoLink: widget.video.manifest ?? "",
              thumbnail: widget.video.thumbnail ?? ""),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          widget.video.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(CustomUtils.viewersWithDate(
                              widget.video.viewers ?? "",
                              widget.video.createdAt ?? "")),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomIconButton(
                                  iconImage: Constants.imageHeart,
                                  iconText: "MASHA ALLAH (10K)"),
                              CustomIconButton(
                                  iconImage: Constants.imageLike,
                                  iconText: "LIKE (10K)"),
                              CustomIconButton(
                                  iconImage: Constants.imageShare,
                                  iconText: "SHARE"),
                              CustomIconButton(
                                  iconImage: Constants.imageReport,
                                  iconText: "REPORT"),
                            ],
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    widget.video.channelImage ?? ""),
                              ),
                              title: Text(
                                widget.video.channelName ?? "",
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(CustomUtils.addStringSubs(
                                  widget.video.channelSubscriber ?? "",
                                  "Subscribers")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    "Subscribe",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: .2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Comments",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Image.asset(Constants.imageComment),
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(5)),
                          hintText: " Add comment ",
                          suffixIcon: const Icon(
                            Icons.send,
                            size: 18,
                          ),
                        )),
                      )
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
