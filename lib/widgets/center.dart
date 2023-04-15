import 'package:flutter/material.dart';

import '../deneb.dart';

mixin DenebCenter on BaseDeneb {
  DenebChild center(
      {Key? key, double? widthFactor, double? heightFactor, Widget? child}) {
    return addWidget((Widget? child) => Center(
          key: key,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        ));
  }
}
