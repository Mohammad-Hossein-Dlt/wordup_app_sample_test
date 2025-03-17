import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });
  final String image;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);
    return Container(
      color: isDarkMode ? dBgAlt2 : bgAlt2,
      child: Column(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? dTextMain : textMain,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: isDarkMode ? dTextMain : textMain,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Text(
            "By BBC.com",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? dHighlight : textColor3,
            ),
          ),
          SizedBox(height: 12),
          Divider(
              color: isDarkMode ? dMainColor : bgAlt, height: 1, thickness: 1),
          SizedBox(height: 12),
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
                    SvgPicture.asset(
                      "assets/svg/arrow-left.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        isDarkMode ? dMainColor : textColor1,
                        BlendMode.srcIn,
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
              SizedBox(width: 25),
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
        ],
      ),
    );
  }
}
