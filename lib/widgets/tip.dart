import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/highlight.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';

class TipWithImage extends StatelessWidget {
  const TipWithImage({
    super.key,
    required this.word,
    required this.phrase,
    required this.description,
    required this.descriptionTranslation,
    required this.example,
    required this.exampleTranslation,
    required this.image,
  });

  final String word;
  final String phrase;
  final String description;
  final String descriptionTranslation;
  final String example;
  final String exampleTranslation;
  final String? image;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);

    double imageWidth = MediaQuery.sizeOf(context).width * 0.8 - 36;

    TextMetrics exampleMetrics = countTextLines(
      TextSpan(
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: mainColor,
          fontStyle: FontStyle.italic,
        ),
        text: example,
      ),
      imageWidth - 70,
    );

    TextMetrics exampleTranslationMetrics = countTextLines(
      TextSpan(
        style: TextStyle(
          fontFamily: "Shabnam",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: mainColor,
          fontStyle: FontStyle.italic,
        ),
        text: exampleTranslation.isNotEmpty ? exampleTranslation : " ",
      ),
      imageWidth - 70,
    );

    double stackHeight = imageWidth +
        exampleMetrics.height +
        exampleTranslationMetrics.height +
        10 +
        30;

    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 620,
        decoration: BoxDecoration(
          color: isDarkMode ? dBgAlt : bgAlt2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        phrase,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? dTextColor2 : textColor2,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 26,
                            height: 26,
                            child: IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor:
                                    isDarkMode ? Colors.transparent : textMain,
                                foregroundColor: Colors.white,
                                iconSize: 22,
                                minimumSize: Size(26, 26),
                                maximumSize: Size(26, 26),
                                shape: CircleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_rounded,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          ClipOval(
                            child: Image.asset("assets/img/iran.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? dTextMain : textMain,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    descriptionTranslation,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? dTextColor2 : textAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Spacer(flex: 2),
              SizedBox(
                height: stackHeight,
                child: Stack(
                  children: [
                    Image.asset(
                      image ?? "",
                      width: imageWidth,
                      height: imageWidth,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: imageWidth - 30,
                      right: 20,
                      left: 20,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isDarkMode ? dBg : bg,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            RichText(
                              text: highlightPattern(
                                example,
                                {
                                  word: isDarkMode ? dTextAccent : textAccent,
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
                            Visibility(
                              visible: exampleTranslation.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  exampleTranslation,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        isDarkMode ? dTextColor2 : textAccent,
                                    fontStyle: FontStyle.italic,
                                  ),
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
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleTip extends StatelessWidget {
  const SimpleTip({
    super.key,
    required this.word,
    required this.phrase,
    required this.description,
    required this.example,
  });
  final String word;
  final String phrase;
  final String description;
  final String example;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);
    double width = MediaQuery.sizeOf(context).width * 0.8;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: width,
        height: 248,
        decoration: BoxDecoration(
          color: isDarkMode ? dBgAlt : bgAlt2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        phrase,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? dTextColor2 : textColor2,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 26,
                            height: 26,
                            child: IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor:
                                    isDarkMode ? Colors.transparent : textMain,
                                foregroundColor: Colors.white,
                                iconSize: 22,
                                minimumSize: Size(26, 26),
                                maximumSize: Size(26, 26),
                                shape: CircleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_rounded,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          ClipOval(
                            child: Image.asset("assets/img/iran.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? dTextMain : textMain,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 4),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: isDarkMode ? dBg : bg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RichText(
                  text: highlightPattern(
                    example,
                    {
                      word: isDarkMode ? dTextAccent : textAccent,
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
            ],
          ),
        ),
      ),
    );
  }
}

class DisabledTip extends StatelessWidget {
  const DisabledTip({
    super.key,
    required this.word,
    required this.phrase,
    required this.description,
    required this.descriptionTranslation,
    required this.example,
    required this.image,
  });

  final String word;
  final String phrase;
  final String description;
  final String descriptionTranslation;
  final String example;
  final String? image;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);

    double imageWidth = MediaQuery.sizeOf(context).width * 0.8 - 36;

    String cuttedText = "${getCuttedText(example, 0.8)}... ";
    // String cuttedText = widget.example;

    TextSpan exampleTextSpan = TextSpan(
      children: [
        highlightPattern(
          cuttedText,
          {
            word: isDarkMode ? dTextAccent : textAccent,
          },
          TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isDarkMode ? dMainColor : mainColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );

    TextMetrics exampleHeight = countTextLines(
      exampleTextSpan,
      imageWidth - 70,
    );

    double stackHeight = imageWidth + exampleHeight.height + 30;

    if (imageWidth - 70 - exampleHeight.lastWidth < 14) {
      stackHeight += exampleHeight.height;
    }

    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 620,
        decoration: BoxDecoration(
          color: isDarkMode ? dBgAlt2 : bgAlt2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        phrase,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? dTextColor2 : textColor2,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 26,
                            height: 26,
                            child: IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor:
                                    isDarkMode ? Colors.transparent : textMain,
                                foregroundColor: Colors.white,
                                iconSize: 22,
                                minimumSize: Size(26, 26),
                                maximumSize: Size(26, 26),
                                shape: CircleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_rounded,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          ClipOval(
                            child: Image.asset("assets/img/iran.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? dTextMain : textMain,
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
              // SizedBox(height: 18),
              Spacer(),
              SizedBox(
                height: stackHeight,
                child: Stack(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Image.asset(
                            image ?? "",
                            width: imageWidth,
                            height: imageWidth,
                          ),
                        ),
                        Container(
                          width: 138,
                          height: 138,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mainColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/lock.svg"),
                              SizedBox(height: 15),
                              Container(
                                width: 86,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: textAccent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "Get Pro",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: imageWidth - 20,
                      right: 20,
                      left: 20,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isDarkMode ? dBg : bg,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                exampleTextSpan,
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  baseline: TextBaseline.ideographic,
                                  child: ConstrainedBox(
                                    constraints:
                                        BoxConstraints.tight(Size(20, 20)),
                                    child: SvgPicture.asset(
                                      "assets/svg/lock.svg",
                                      width: 14,
                                      height: 17,
                                      colorFilter: ColorFilter.mode(
                                        isDarkMode ? dMainColor : textColor1,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String getCuttedText(String text, double percent) {
    List<String> words = text.split(' ');

    int count = (words.length * percent).ceil();

    List<String> cutted = words.take(count).toList();

    return cutted.join(' ');
  }
}

// Since in the UI design, the text starts a little above the bottom edge of the image,
// we had to calculate the text height in order to determine the final height of the example text box.

class TextMetrics {
  double height;
  double lastWidth;

  TextMetrics({
    required this.height,
    required this.lastWidth,
  });
}

TextMetrics countTextLines(TextSpan text, double maxWidth) {
  final textPainter = TextPainter(
    text: text,
    textDirection: TextDirection.ltr,
    textWidthBasis: TextWidthBasis.longestLine,
  );

  textPainter.layout(maxWidth: maxWidth);

  final lineMetrics = textPainter.computeLineMetrics();
  double totalHeight = lineMetrics.fold(0.0, (sum, line) => sum + line.height);
  return TextMetrics(height: totalHeight, lastWidth: lineMetrics.last.width);
}
