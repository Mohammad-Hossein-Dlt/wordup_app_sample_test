import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';

class Collocations extends StatelessWidget {
  const Collocations({
    super.key,
    required this.phrases,
  });
  final List<String> phrases;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Collocations",
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
                "It often appears as:",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: isDarkMode ? dTextMain : textMain,
                ),
              ),
              Spacer(),
              Column(
                spacing: 8,
                children: [
                  ...phrases.map(
                    (e) {
                      List<String> splitted = e.trim().split(" ");
                      String firstPart = splitted[0];
                      String secondPart = splitted[1];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationZ(math.pi / 4),
                            child: Container(
                              width: 12,
                              height: 12,
                              color: textColor6,
                            ),
                          ),
                          SizedBox(width: 8),
                          Row(
                            children: [
                              Text(
                                firstPart,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: isDarkMode ? dTextMain : textMain,
                                ),
                              ),
                              Text(" "),
                              Text(
                                secondPart,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: isDarkMode ? dTextAccent : textAccent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
