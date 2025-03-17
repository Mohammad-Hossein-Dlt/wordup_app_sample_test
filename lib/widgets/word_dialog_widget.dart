import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';

class WordDialogWidget extends StatelessWidget {
  const WordDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);

    return Container(
      width: MediaQuery.sizeOf(context).width - 38,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? dBgAlt2 : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  "assets/img/img3.png",
                  width: MediaQuery.sizeOf(context).width - 74,
                  height: 220,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: isDarkMode ? dBgAlt3 : bgAlt,
                    foregroundColor: isDarkMode ? dMainColor : mainColor,
                    minimumSize: Size(35, 35),
                    maximumSize: Size(35, 35),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close_rounded),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: isDarkMode ? dBgAlt3 : bgAlt,
                    foregroundColor: isDarkMode ? dMainColor : mainColor,
                    minimumSize: Size(35, 35),
                    maximumSize: Size(35, 35),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz_rounded),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Content",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? dTextMain : textMain,
                ),
              ),
              Text(
                "noun",
                style: TextStyle(
                  fontSize: 14,
                  color: cm1,
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              SvgPicture.asset(
                "assets/svg/volume-control-full.svg",
                colorFilter: ColorFilter.mode(
                  isDarkMode ? dMainColor : textColor1,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4),
              Row(
                children: [
                  Text(
                    "/ˈkɑːntent/",
                    style: TextStyle(
                      fontFamily: "NotoSerif",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? dTextMain : textMain,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    "#1749",
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
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "محتوا",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? dTextColor2 : textAccent,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "The things that are held or included in something",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isDarkMode ? dTextMain : textMain,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? dBgAlt3 : bgAlt,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(
                      ((MediaQuery.sizeOf(context).width - 76) / 2) - 10, 40),
                  maximumSize: Size(
                      ((MediaQuery.sizeOf(context).width - 76) / 2) - 10, 40),
                ),
                onPressed: () {},
                child: Text(
                  "Look up",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? dTextMain : textColor3,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? dTextColor2 : textAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(
                      ((MediaQuery.sizeOf(context).width - 76) / 2) - 10, 40),
                  maximumSize: Size(
                      ((MediaQuery.sizeOf(context).width - 76) / 2) - 10, 40),
                ),
                onPressed: () {},
                child: Text(
                  "Got it!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
