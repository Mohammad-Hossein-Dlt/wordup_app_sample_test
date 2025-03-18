import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/constants/data.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';
import 'package:wordup_flutter_test/widgets/collocations.dart';
import 'package:wordup_flutter_test/widgets/compare_with.dart';
import 'package:wordup_flutter_test/widgets/footer.dart';
import 'package:wordup_flutter_test/widgets/lesson.dart';
import 'package:wordup_flutter_test/widgets/quote.dart';
import 'package:wordup_flutter_test/widgets/tip.dart';
import 'package:wordup_flutter_test/widgets/video.dart';
import 'package:wordup_flutter_test/widgets/word_definition.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({super.key});

  @override
  State<DefinitionScreen> createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  bool isDarkMode = false;
  String currentId = "";
  int currentIndex = 0;

  List<String> tips = [];

  @override
  void initState() {
    super.initState();

    currentId = wordData.senses.first.id ?? "";
    tips = wordData.senses.first.tp?.split("\r\n") ?? [];
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = AppTheme.isDarkMode(context);
    tips = wordData.senses[currentIndex].tp?.split("\r\n") ?? [];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 620,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.network(
                          "https://word-images.cdn-wordup.com/senses/$currentId.webp?v=1",
                          fit: BoxFit.fill,
                          height: 364,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 25,
                          left: 20,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: isDarkMode ? dBgAlt3 : bgAlt,
                              foregroundColor:
                                  isDarkMode ? dMainColor : textColor1,
                              minimumSize: Size(35, 35),
                              maximumSize: Size(35, 35),
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.close_rounded),
                          ),
                        ),
                        Positioned(
                          top: 25,
                          right: 20,
                          child: PopupMenuButton(
                            style: IconButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: isDarkMode ? dBgAlt3 : bgAlt,
                              foregroundColor:
                                  isDarkMode ? dMainColor : textColor1,
                              minimumSize: Size(35, 35),
                              maximumSize: Size(35, 35),
                            ),
                            offset: Offset(-36, 33),
                            menuPadding: EdgeInsets.zero,
                            position: PopupMenuPosition.under,
                            color: isDarkMode ? dBgAlt3 : bgAlt,
                            onSelected: (value) {},
                            icon: Icon(Icons.more_horiz_rounded),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                PopupMenuItem(
                                  padding: EdgeInsets.zero,
                                  child: popupMenuItem(
                                      "assets/svg/share.svg", "Share"),
                                ),
                                PopupMenuItem(
                                  enabled: false,
                                  height: 1,
                                  padding: EdgeInsets.zero,
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: isDarkMode ? dMainColor : mainColor,
                                  ),
                                ),
                                PopupMenuItem(
                                  padding: EdgeInsets.zero,
                                  child: popupMenuItem(
                                      "assets/svg/note.svg", "Add Note"),
                                ),
                                PopupMenuItem(
                                  enabled: false,
                                  height: 0.5,
                                  padding: EdgeInsets.zero,
                                  child: Divider(
                                    height: 0.5,
                                    thickness: 0.5,
                                    color: isDarkMode ? dMainColor : mainColor,
                                  ),
                                ),
                                PopupMenuItem(
                                  padding: EdgeInsets.zero,
                                  child: popupMenuItem(
                                      "assets/svg/star.svg", "Favorite"),
                                ),
                                PopupMenuItem(
                                  enabled: false,
                                  height: 0.5,
                                  padding: EdgeInsets.zero,
                                  child: Divider(
                                    height: 0.5,
                                    thickness: 0.5,
                                    color: isDarkMode ? dMainColor : mainColor,
                                  ),
                                ),
                                PopupMenuItem(
                                  padding: EdgeInsets.zero,
                                  child: popupMenuItem(
                                      "assets/svg/bookmark.svg", "Add to list"),
                                ),
                                PopupMenuItem(
                                  enabled: false,
                                  height: 1,
                                  padding: EdgeInsets.zero,
                                  child: Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: isDarkMode ? dMainColor : mainColor,
                                  ),
                                ),
                                PopupMenuItem(
                                  padding: EdgeInsets.zero,
                                  child: popupMenuItem(
                                      "assets/svg/report.svg", "Report Image"),
                                ),
                              ];
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 285,
                            child: HeaderPageView(
                              onPageChanged: (value) {
                                setState(() {
                                  currentIndex = value;
                                  currentId = wordData.senses[value].id ?? "";
                                });
                              },
                              children: [
                                ...wordData.senses.map(
                                  (e) => WordDefinition(
                                    id: "11193",
                                    word: "Happy",
                                    phonetic: "/ˈhæpi/",
                                    tag: "#472",
                                    type: e.ty ?? "",
                                    description: e.de ?? "",
                                    example: e.ex ?? "",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/tips.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        "Pro Tips",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? dTextColor2 : textColor4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: currentIndex == 0 ? 620 : 248,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.84),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...tips.map(
                          (e) {
                            String descriptionTranslation = "";
                            String exampleTranslation = "";
                            List newTp = e.split("|");
                            if (currentId == wordData.senses.first.id &&
                                e == tips.first) {
                              descriptionTranslation =
                                  "در هنگام بیان خلق و خوی یک فرد، معمولا با تاکید بر مثبت بودن یا شادی استفاده می شود.";
                              exampleTranslation =
                                  "او از دیدن دوستانش بعد از مدت ها بسیار خوشحال شد.";
                            }

                            if (currentIndex == 0) {
                              if (e == tips.first) {
                                return TipWithImage(
                                  word: "happy",
                                  phrase: newTp[0],
                                  description: newTp[1],
                                  descriptionTranslation:
                                      descriptionTranslation,
                                  example: newTp[2],
                                  exampleTranslation: exampleTranslation,
                                  image: "assets/img/img2.png",
                                );
                              } else {
                                return DisabledTip(
                                  word: "happy",
                                  phrase: newTp[0],
                                  description: newTp[1],
                                  descriptionTranslation:
                                      descriptionTranslation,
                                  example: newTp[2],
                                  image: "assets/img/img2.png",
                                );
                              }
                            } else {
                              return SimpleTip(
                                word: "happy",
                                phrase: newTp[0],
                                description: newTp[1],
                                example: newTp[2],
                              );
                            }
                          },
                        ),
                        Collocations(
                          phrases: wordData.senses[currentIndex].cl,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  CompareWith(
                    word: "Happy",
                    comparisons: wordData.comparisons,
                  ),
                  Video(
                    link:
                        "https://word-images.cdn-wordup.com/video/$currentId.mp4",
                    caption:
                        "you're going to notice there's something much deeper going on. I've collected thousands of these stories from people all around the world, and I can tell you it's amazing, because when people recount the memories in which they had the most fun, they tell you about some of the happiest and treasured memories of their lives.",
                  ),
                  Lesson(
                    text:
                        "Learn to enjoy every minute of your life. Be happy now.",
                    word: "happy",
                  ),
                  Quote(
                    profile: "assets/img/profile.png",
                    name: "Julia Roberts",
                    field: "American Actress",
                    text:
                        "❝ The older you get, the more fragile you understand life to be. I think that's good motivation for getting out of bed happily each day.❞",
                    word: "happily",
                  ),
                  Quote(
                    profile: "assets/img/profile2.png",
                    name: "Lexi",
                    field: "Interesting fact",
                    text:
                        "Porem ipsum dolor sit amet, happy consectetur adipiscing elit.",
                    word: "happy",
                  ),
                  Footer(
                    image: "assets/img/guys.png",
                    title:
                        "Rorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    text:
                        "Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                  ),
                  SizedBox(height: 85),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 85,
                color: isDarkMode ? dBgAlt3 : bgAlt,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: textAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(
                            ((MediaQuery.sizeOf(context).width - 74) / 2) - 10,
                            40),
                        maximumSize: Size(
                            ((MediaQuery.sizeOf(context).width - 74) / 2) - 10,
                            40),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Should Learn",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: cm1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(
                            ((MediaQuery.sizeOf(context).width - 74) / 2) - 10,
                            40),
                        maximumSize: Size(
                            ((MediaQuery.sizeOf(context).width - 74) / 2) - 10,
                            40),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Already Knew",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popupMenuItem(String icon, String text) {
    return Container(
      width: 150,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              isDarkMode ? dMainColor : mainColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: isDarkMode ? dTextMain : textColor7),
          ),
        ],
      ),
    );
  }
}

class HeaderPageView extends StatefulWidget {
  const HeaderPageView({
    super.key,
    required this.children,
    required this.onPageChanged,
  });
  final List<Widget> children;
  final Function(int value) onPageChanged;

  @override
  State<HeaderPageView> createState() => _HeaderPageViewState();
}

class _HeaderPageViewState extends State<HeaderPageView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView(
      onPageChanged: (value) {
        widget.onPageChanged(value);
      },
      controller: PageController(viewportFraction: 0.9),
      scrollDirection: Axis.horizontal,
      children: widget.children,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
