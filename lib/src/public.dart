import 'package:flutter/cupertino.dart';
import 'package:routils/src/ro_string_utils.dart';

///Text of String is empty or not.
bool roIsEmpty(String text) => RoStringUtils.isEmpty(text);

///Get size for text of String.
Size roSizeForString(String text, TextStyle style,
    {double maxWidth = double.infinity,
      double minWidth = 0,
      int maxLines = 100}) =>
    RoStringUtils.sizeForString(text, style,
        maxWidth: maxWidth, minWidth: minWidth, maxLines: maxLines);

///Get width for text of String.
double roWidthForString(String text, TextStyle style) =>
    RoStringUtils.widthForString(text, style);

///Get height for text of String.
double roHeightForString(String text, TextStyle style,
    {double maxWidth = double.infinity}) =>
    RoStringUtils.heightForString(text, style);

/// Reverse text of String.
String roReverse(String text) => RoStringUtils.reverse(text);

///Get text has overflowed Use an ellipsis to indicate.
String roTextOverflowedUseEllipsis(String text, TextStyle style, double maxWidth,
    {RoTextOverflowEllipsis type = RoTextOverflowEllipsis.end,
      String replacement = '...'}) =>
    RoStringUtils.textOverflowedUseEllipsis(text, style, maxWidth,
        type: type, replacement: replacement);

///Encode text of String to md5.
String roMd5Encode(String text) => RoStringUtils.roMd5Encode(text);

///Encode text of String to base64 String.
String roBase64Encode(String text) => RoStringUtils.roBase64Encode(text);

//Decode base64 text of String to String.
String roBase64Decode(String text) => RoStringUtils.roBase64Decode(text);
