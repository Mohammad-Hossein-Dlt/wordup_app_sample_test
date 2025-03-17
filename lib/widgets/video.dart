import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/highlight.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';

class Video extends StatefulWidget {
  const Video({
    super.key,
    required this.link,
    required this.caption,
  });
  final String link;
  final String caption;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> with AutomaticKeepAliveClientMixin {
  bool isDarkMode = false;
  late VideoPlayerController _controller;

  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.link),
    )..setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _controller.initialize();
    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: true,
    );
    return true;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    isDarkMode = AppTheme.isDarkMode(context);

    super.build(context);
    return Container(
      color: isDarkMode ? dBgAlt2 : bgAlt2,
      child: Column(
        children: [
          Divider(
              color: isDarkMode ? dMainColor : bgAlt, height: 1, thickness: 1),
          SizedBox(height: 12),
          FutureBuilder(
            future: started(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data ?? false) {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: chewieController),
                );
              } else {
                return placeHolder();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 38),
            child: RichText(
              text: highlightPattern(
                widget.caption,
                {
                  "happiest": isDarkMode ? dTextAccent : textAccent,
                },
                TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? dTextMain : textMain,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Divider(
              color: isDarkMode ? dMainColor : bgAlt, height: 1, thickness: 1),
          SizedBox(height: 12),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/upload-thick-bottom.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? dMainColor : textColor1,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: isDarkMode ? dTextMain : textMain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget placeHolder() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 190,
              color: isDarkMode ? dBg2 : bgAlt,
            ),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: highlight2,
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: mainColor,
                size: 46,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
