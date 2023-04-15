import 'package:deneb/deneb.dart';
import 'package:flutter/material.dart';

mixin DenebSizedBox on BaseDeneb {
  DenebChild sizedBox({Key? key, double? width, double? height}) {
    return addWidget((Widget? child) {
      return SizedBox(key: key, width: width, height: height);
    });
  }
}
