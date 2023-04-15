import 'package:deneb/deneb.dart';
import 'package:flutter/material.dart';

mixin DenebText on BaseDeneb {
  DenebTail text(
    String data, {
    final InlineSpan? textSpan,
    final TextStyle? style,
    final StrutStyle? strutStyle,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final Locale? locale,
    final bool? softWrap,
    final TextOverflow? overflow,
    final double? textScaleFactor,
    final int? maxLines,
    final String? semanticsLabel,
    final TextWidthBasis? textWidthBasis,
    final TextHeightBehavior? textHeightBehavior,
  }) {
    return addNoChildWidget((Widget? child) {
      return Text(
        data,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    });
  }
}
