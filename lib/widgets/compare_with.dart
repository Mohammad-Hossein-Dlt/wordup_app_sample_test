import 'package:flutter/material.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/highlight.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';

class CompareWith extends StatefulWidget {
  const CompareWith({
    super.key,
    required this.word,
    required this.comparisons,
  });

  final String word;
  final List<String> comparisons;

  @override
  State<CompareWith> createState() => _CompareWithState();
}

class _CompareWithState extends State<CompareWith> {
  String selected = "";
  String text = "";
  List<Map<String, String>> comparisons = [];

  @override
  void initState() {
    super.initState();

    for (var element in widget.comparisons) {
      List splited = element.split("|");

      comparisons.add(
        {
          splited[0] ?? "": splited[1] ?? "",
        },
      );
    }

    selected = comparisons.first.keys.first;
    text = comparisons.first.values.first;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppTheme.isDarkMode(context);
    return Container(
      color: isDarkMode ? dBgAlt2 : bgAlt2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Compare with",
              style: TextStyle(
                color: isDarkMode ? dTextColor2 : textColor3,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                ...comparisons.map(
                  (e) => SizedBox(
                    height: 34,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: e.keys.first == selected
                            ? highlight3
                            : isDarkMode
                                ? dBgAlt3
                                : bgAlt,
                        foregroundColor: e.keys.first == selected
                            ? Colors.white
                            : isDarkMode
                                ? dTextMain
                                : textMain,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selected = e.keys.first;
                          text = e.values.first;
                        });
                      },
                      child: Text(e.keys.first),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
            child: RichText(
              text: highlightPatternWithAction(
                text,
                {
                  selected: highlight,
                  widget.word: isDarkMode ? dTextAccent : textAccent,
                },
                TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? dTextMain : textMain,
                ),
                context,
              ),
            ),
          ),
          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Image.asset(
              "assets/img/img3.png",
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
