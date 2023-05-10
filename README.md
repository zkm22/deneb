#### get rid of NESTED HELL

---

```dart
  // define widgets
  extension MyWidgets on Deneb {
    DenebChild center(
      {Key? key, double? widthFactor, double? heightFactor, Widget? child}) {
        return addWidget((Widget? child) => Center(
              key: key,
              widthFactor: widthFactor,
              heightFactor: heightFactor,
              child: child,
            ));
    }
    DenebChild myWidget({Color color = Colors.red}) {
      return addWidget((Widget? child) => Container(
            width: 100,
            height: 100,
            color: color,
            child: child,
          ));
    }
    // no child widget
    DenebTail text(String data) {
      return addNoChildWidget((Widget? child) {
        return Text(
          data,
        );
      });
    }
    // multi child widget
    DenebBundle row() {
    return addMultiChildWidget((List<Widget> widgets) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ));
    }
  }
  Deneb()
    .myWidget(
      width: 100,
      height: 100,
      color: Colors.green,
    )
    .center()
    .myWidget(
      width: 50,
      height: 50,
      color: Colors.red,
    )
    .text('some text')
  .build()
```

is the same as

```dart
  Container(
    width: 100,
    height: 100,
    color: Colors.green,
    child: Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: Text('some text')
      ),
    ),
  )
```

#### for a row

---

```dart
  extension MyRow on Deneb {
    DenebBundle row() {
      return addMultiChildWidget((List<Widget> widgets) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ));
    }
  }
  Deneb().row().bundle([
      Deneb().myWidget(color: Colors.green, width: 100, height: 100).build(),
      Deneb().myWidget(color: Colors.red, width: 100, height: 100).build(),
    ]).build()
```

equals

```dart
  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(height: 100, width: 100, color: Colors.green),
      Container(height: 100, width: 100, color: Colors.red),
    ],
  ),
```

#### for an external widget

---

```dart
  Deneb()
    .container(width: 100, height: 100, color: Colors.red)
    .external(const Text('some text'))
    .build()
```
