import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';

enum RoTextOverflowEllipsis {
  //Use an ellipsis to indicate that the text has overflowed at start.
  start,
  //Use an ellipsis to indicate that the text has overflowed at middle.
  middle,
  //Use an ellipsis to indicate that the text has overflowed at end.
  end,
}

class RoStringUtils {
  ///Text of String is empty or not.
  static bool isEmpty(String text) => (text == null || text.isEmpty);

  ///Get size for text of String.
  static Size sizeForString(String text, TextStyle style,
      {double maxWidth = double.infinity,
      double minWidth = 0,
      int maxLines = 100}) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.size;
  }

  ///Get width for text of String.
  static double widthForString(String text, TextStyle style) =>
      sizeForString(text, style).width;

  ///Get height for text of String.
  static double heightForString(String text, TextStyle style,
          {double maxWidth = double.infinity}) =>
      sizeForString(text, style, maxWidth: maxWidth).height;

  /// Reverse text of String.
  static String reverse(String text) {
    if (isEmpty(text)) return text;
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }

  ///Get text has overflowed Use an ellipsis to indicate.
  static String textOverflowedUseEllipsis(
      String text, TextStyle style, double maxWidth,
      {RoTextOverflowEllipsis type = RoTextOverflowEllipsis.end,
      String replacement = '...'}) {
    String resStr = text;
    int start = text.length ~/ 2;
    int end = start + 1;
    double strWidth = widthForString(resStr, style);
    while (strWidth > maxWidth) {
      resStr = "${text.substring(0, start)}${text.substring(end, text.length)}";
      strWidth = widthForString("$resStr$replacement", style);
      start--;
      end++;
      start = start > 0 ? start : 0;
      end = end < text.length ? end : text.length;
    }
    if (end - start > 1) {
      switch (type) {
        case RoTextOverflowEllipsis.start:
          resStr =
              "$replacement${text.substring(0, start)}${text.substring(end, text.length)}";
          break;
        case RoTextOverflowEllipsis.middle:
          resStr =
              "${text.substring(0, start)}$replacement${text.substring(end, text.length)}";
          break;
        case RoTextOverflowEllipsis.end:
          resStr =
              "${text.substring(0, start)}${text.substring(end, text.length)}$replacement";
          break;
      }
    }
    return resStr;
  }

  ///Encode text of String to md5.
  static String roMd5Encode(String text) {
    final content = Utf8Encoder().convert(text);
    final digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  ///Encode text of String to base64 String.
  static String roBase64Encode(String text) {
    final content = Utf8Encoder().convert(text);//等价于 utf8.encode(text);
    final digest = base64Encode(content);
    return digest;
  }

  //Decode base64 text of String to String.
static String roBase64Decode(String text) {
    final List<int> bytes = base64Decode(text);
    final String res = Utf8Decoder().convert(bytes);//等价于 utf8.decode(bytes);
    return res;
}
}
