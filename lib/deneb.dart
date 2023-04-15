import 'package:deneb/widgets/center.dart';
import 'package:deneb/widgets/column.dart';
import 'package:deneb/widgets/container.dart';
import 'package:deneb/widgets/sized_box.dart';
import 'package:deneb/widgets/text.dart';
import 'package:flutter/widgets.dart';

// typedef WidgetFunction = Widget Function();
typedef DenebWidget = Widget Function(Widget? child);
typedef MultiChildDenebWidget = Widget Function(List<Widget> widgets);

enum StyleEnum {
  material,
  cupertino,
}

class DenebTail {

  final DenebChild _denebChild;

  DenebTail(this._denebChild);

  Widget build() {
    return _denebChild.build();
  }
}

class DenebBundle {
  List<Widget> _bundledWidgets = [];
  final MultiChildDenebWidget _multiChildDenebWidget;
  final List<DenebWidget> _childList;


  DenebBundle(
    this._childList,
    this._multiChildDenebWidget,
  );

  DenebBundled bundle(List<Widget> widgets) {
    _bundledWidgets = widgets;
    return DenebBundled(_multiChildDenebWidget, _bundledWidgets, _childList);
  }
}

class DenebBundled {

  Widget? _cur;
  final MultiChildDenebWidget _multiChildDenebWidget;
  final List<Widget> _bundledWidgets;
  final List<DenebWidget> _rootChildList;

  DenebBundled(
    this._multiChildDenebWidget,
    this._bundledWidgets,
    this._rootChildList,
  );

  
  Widget build() {
    _cur = _multiChildDenebWidget(_bundledWidgets);
    for (var i = _rootChildList.length - 1; i > -1; --i) {
      _cur = _rootChildList[i](_cur);
    }
    if (_cur == null) {
      throw Exception('no widget to build');
    }
    return _cur!;
  }
}

class BaseDeneb {

  final List<DenebWidget> _childList;

  Widget? _cur;
  
  Widget? _externalWidget;

  DenebTail? _denebTail;
  DenebBundle? _denebBundle;

  DenebChild? _denebChild;

  MultiChildDenebWidget? _multiChildDenebWidget;

  BaseDeneb(): _childList = [];

  DenebTail external(Widget widget) {
    _denebChild ??= DenebChild(_childList);
    _denebTail ??= DenebTail(_denebChild!);
    _externalWidget = widget;
    return _denebTail!;
  }

  DenebChild addWidget(DenebWidget denebWidget) {
    _childList.add(denebWidget);
    _denebChild ??= DenebChild(_childList);
    return _denebChild!;
  }

  DenebBundle addMultiChildWidget(MultiChildDenebWidget multiChildDenebWidget) {
    _multiChildDenebWidget = multiChildDenebWidget;
    _denebBundle ??= DenebBundle(_childList, _multiChildDenebWidget!);
    return _denebBundle!;
  }

  DenebTail addNoChildWidget(DenebWidget denebWidget) {
    _denebChild ??= DenebChild(_childList);
    _denebTail ??= DenebTail(_denebChild!);
    _childList.add(denebWidget);
    return _denebTail!;
  }

}

class Deneb extends BaseDeneb with
  DenebContainer, DenebColumn, DenebText, DenebSizedBox, DenebCenter {}

class DenebChild extends Deneb {

  final List<DenebWidget> _childList;

  DenebChild(this._childList): super();

  @override
  DenebTail external(Widget widget) {
    _denebTail ??= DenebTail(this);
    _externalWidget = widget;
    return _denebTail!;
  }

  @override
  DenebChild addWidget(DenebWidget denebWidget) {
    _childList.add(denebWidget);
    return this;
  }

  @override
  DenebBundle addMultiChildWidget(MultiChildDenebWidget multiChildDenebWidget) {
    _multiChildDenebWidget = multiChildDenebWidget;
    _denebBundle ??= DenebBundle(_childList, _multiChildDenebWidget!);
    return _denebBundle!;
  }

  Widget build() {
    _cur = _externalWidget != null ? _externalWidget! : null;
    for (var i = _childList.length - 1; i > -1; --i) {
      _cur = _childList[i](_cur);
    }
    if (_cur == null) {
      throw Exception('no widget to build');
    }
    return _cur!;
  }
}
