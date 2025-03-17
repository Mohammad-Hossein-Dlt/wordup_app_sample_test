import 'package:flutter/material.dart';
import 'package:wordup_flutter_test/constants/colors.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';
import 'package:wordup_flutter_test/widgets/word_dialog_widget.dart';

TextSpan highlightPattern(
  String text,
  Map<String, Color> highlights,
  TextStyle style,
) {
  List<TextSpan> spans = [];
  int lastMatchEnd = 0;

  String pattern = highlights.keys.map((e) => '\\b$e\\w*\\b').join('|');
  RegExp regex = RegExp(pattern, caseSensitive: false);

  for (RegExpMatch match in regex.allMatches(text)) {
    if (match.start > lastMatchEnd) {
      spans.add(
        TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: style,
        ),
      );
    }

    String matchedText = match.group(0)!;

    Color? highlightColor;
    for (var key in highlights.keys) {
      if (RegExp('\\b$key\\w*\\b', caseSensitive: false)
          .hasMatch(matchedText)) {
        highlightColor = highlights[key];
        break;
      }
    }

    spans.add(
      TextSpan(
        text: matchedText,
        style: style.merge(
          TextStyle(
            color: highlightColor,
          ),
        ),
      ),
    );

    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < text.length) {
    spans.add(
      TextSpan(
        text: text.substring(lastMatchEnd),
        style: style,
      ),
    );
  }

  return TextSpan(
    children: spans,
    style: style,
  );
}

TextSpan highlightPatternWithAction(
  String text,
  Map<String, Color> highlights,
  TextStyle style,
  BuildContext ctx,
) {
  List<InlineSpan> spans = [];
  int lastMatchEnd = 0;

  String pattern = highlights.keys.map((e) => '\\b$e\\w*\\b').join('|');
  RegExp regex = RegExp(pattern, caseSensitive: false);

  for (RegExpMatch match in regex.allMatches(text)) {
    if (match.start > lastMatchEnd) {
      spans.add(
        TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: style,
        ),
      );
    }

    String matchedText = match.group(0)!;

    Color? highlightColor;
    for (var key in highlights.keys) {
      if (RegExp('\\b$key\\w*\\b', caseSensitive: false)
          .hasMatch(matchedText)) {
        highlightColor = highlights[key];
        break;
      }
    }

    spans.add(
      WidgetSpan(
        child: InkWell(
          onTap: () {
            if (matchedText.toLowerCase() == 'content') {
              bool isDarkMode = AppTheme.isDarkMode(ctx);
              showDialog(
                context: ctx,
                barrierColor: isDarkMode
                    ? bgAlt.withValues(alpha: 0.45)
                    : dBgAlt.withValues(alpha: 0.45),
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.zero,
                    surfaceTintColor: Colors.transparent,
                    child: WordDialogWidget(),
                  );
                },
              );
            }
          },
          child: Text(
            matchedText,
            style: style.merge(
              TextStyle(
                color: highlightColor,
              ),
            ),
          ),
        ),
      ),
    );

    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < text.length) {
    spans.add(
      TextSpan(
        text: text.substring(lastMatchEnd),
        style: style,
      ),
    );
  }

  return TextSpan(
    children: spans,
    style: style,
  );
}
