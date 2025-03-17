import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/highlight.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';

class Quote extends StatelessWidget {
  const Quote({
    super.key,
    required this.profile,
    required this.name,
    required this.field,
    required this.text,
    required this.word,
  });

  final String profile;
  final String name;
  final String field;
  final String text;
  final String word;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);

    return Container(
      color: isDarkMode ? dBgAlt2 : bgAlt2,
      child: Column(
        children: [
          Divider(
              color: isDarkMode ? dMainColor : bgAlt, height: 1, thickness: 1),
          SizedBox(height: 15),
          ClipOval(
            child: Image.asset(profile),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? dTextMain : textMain,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            field,
            style: TextStyle(
              fontSize: 13,
              color: isDarkMode ? dHighlight : textColor3,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 115,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: highlightPattern(
                  text,
                  {word: isDarkMode ? dTextAccent : textAccent},
                  TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? dTextMain : textMain,
                  ),
                ),
              ),
            ),
          ),
          ClipOval(
            child: Image.asset("assets/img/iran.png"),
          ),
          SizedBox(height: 18),
          Divider(
              color: isDarkMode ? dMainColor : bgAlt, height: 1, thickness: 1),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDarkMode ? Colors.transparent : mainColor,
                          border: Border.all(
                            width: 2,
                            color: isDarkMode ? dMainColor : Colors.transparent,
                          )),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Listen",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? dTextMain : textMain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Column(
                  children: [
                    Image.asset(
                      "assets/img/avatar2.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Explain",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? dTextMain : textMain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Column(
                  children: [
                    Image.asset(
                      profile,
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Discuss",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? dTextMain : textMain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
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
                    SizedBox(height: 10),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
