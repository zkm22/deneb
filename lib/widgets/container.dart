import 'package:deneb/deneb.dart';
import 'package:flutter/material.dart';

mixin DenebContainer on BaseDeneb {
  DenebChild container({
    final Key? key,
    final AlignmentGeometry? alignment,
    final EdgeInsetsGeometry? padding,
    final Color? color,
    final Decoration? decoration,
    final Decoration? foregroundDecoration,
    final BoxConstraints? constraints,
    final EdgeInsetsGeometry? margin,
    final Matrix4? transform,
    final AlignmentGeometry? transformAlignment,
    final Clip clipBehavior = Clip.none,
    final double? width,
    final double? height,
  }) {
    return addWidget((Widget? child) {
      return Container(
        key: key,
        constraints: constraints,
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: child,
      );
    });
  }
}
