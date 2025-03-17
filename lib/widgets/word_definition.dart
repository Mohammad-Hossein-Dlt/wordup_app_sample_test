import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/highlight.dart';
import 'package:wordup_flutter_test/utlis/pagemanager.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';
import 'package:wordup_flutter_test/utlis/theme/theme_entities.dart';
import 'package:wordup_flutter_test/utlis/theme/theme_provider.dart';

class WordDefinition extends StatefulWidget {
  const WordDefinition({
    super.key,
    required this.id,
    required this.word,
    required this.phonetic,
    required this.tag,
    required this.type,
    required this.description,
    required this.example,
  });

  final String id;
  final String word;
  final String phonetic;
  final String tag;
  final String type;
  final String description;
  final String example;

  @override
  State<WordDefinition> createState() => _WordDefinitionState();
}

class _WordDefinitionState extends State<WordDefinition> {
  PageManager pm = PageManager.init();

  String gender = "m";

  void play() async {
    await pm.dispose();

    pm = PageManager(
      path:
          "https://speech.cdn-wordup.com/words/all/gb/$gender/${widget.id}.mp3",
    );

    print(pm.path);
    pm.play();

    setState(
      () {
        if (gender == "m") {
          gender = "f";
        } else {
          gender = "m";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);

    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.88,
        decoration: BoxDecoration(
          color: isDarkMode ? dBgAlt2 : bgAlt2,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
              ),
              onPressed: () async {
                play();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 18, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.word,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? dTextMain : textMain,
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          height: 24,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 32,
                                height: 24,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: isDarkMode ? cm1 : bg,
                                    minimumSize: Size(32, 24),
                                    maximumSize: Size(32, 24),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .setTheme = ThemeEntities.dark;
                                  },
                                  child: SvgPicture.asset(
                                    "assets/svg/night-moon-new.svg",
                                    colorFilter: ColorFilter.mode(
                                      isDarkMode ? Colors.white : mainColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 32,
                                height: 24,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: isDarkMode ? bg : cm1,
                                    minimumSize: Size(32, 24),
                                    maximumSize: Size(32, 24),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .setTheme = ThemeEntities.light;
                                  },
                                  child: SvgPicture.asset(
                                    "assets/svg/weather-sun.svg",
                                    colorFilter: ColorFilter.mode(
                                      isDarkMode ? mainColor : Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/volume-control-full.svg",
                              colorFilter: ColorFilter.mode(
                                isDarkMode ? dMainColor : mainColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 4),
                            Row(
                              children: [
                                Text(
                                  widget.phonetic,
                                  style: TextStyle(
                                    fontFamily: "NotoSerif",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode ? dTextMain : textMain,
                                  ),
                                ),
                                Text(
                                  widget.tag,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode ? dTextMain : textMain,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          widget.type,
                          style: TextStyle(
                            fontSize: 14,
                            color: cm1,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Divider(
                  color: isDarkMode ? dMainColor : bgAlt,
                  height: 1,
                  thickness: 1),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                widget.description,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: RichText(
                text: highlightPattern(
                  widget.example,
                  {
                    widget.word: isDarkMode ? dTextAccent : textAccent,
                  },
                  TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: isDarkMode ? dTextMain : textMain,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                right: 18,
                bottom: 21,
                left: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor:
                            isDarkMode ? Colors.transparent : textMain,
                        foregroundColor: Colors.white,
                        iconSize: 22,
                        minimumSize: Size(28, 28),
                        maximumSize: Size(28, 28),
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 2,
                            color:
                                isDarkMode ? Colors.white : Colors.transparent,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow_rounded,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(84, 26),
                      maximumSize: Size(84, 26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Translation",
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode ? dTextAccent : textAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
