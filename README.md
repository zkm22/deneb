#### get rid of NESTED HELL
---
``` dart
  Deneb()
    .container(
      width: 100,
      height: 100,
      color: Colors.green,
    )
    .center()
    .container(
      width: 50,
      height: 50,
      color: Colors.red,
    )
    .text('some text')
  .build()
```
 is the same as
``` dart
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
#### for a column
---
``` dart
  Deneb()
    .column()
    .bundle([
      Deneb()
        .container(
          height: 50,
          width: 50,
          color: Colors.red
        )
        .build(),
      // or just primitive widget
      Container(
        height: 50,
        width: 50,
        color: Colors.green
      ),
    ])
  .build(),
```
equals
``` dart
  Column(
    children: [
      Container(height: 50, width: 50, color: Colors.red),
      Container(height: 50, width: 50, color: Colors.green),
    ],
  ),
```
#### for an external widget
---
``` dart
  Deneb()
    .container(width: 100, height: 100, color: Colors.red)
    .external(const Text('some text'))
    .build()
```
#### want some self style widgets?
---
``` dart
  extension MyWidget on Deneb {
    DenebChild myWidget({Color color = Colors.red}) {
      return addWidget((Widget? child) => Container(
            width: 100,
            height: 100,
            color: color,
            child: child,
          ));
    }
  }
  // or
  extension MyRow on Deneb {
    DenebBundle myRow() {
      return addMultiChildWidget((List<Widget> widgets) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ));
    }
  }

  // then use it
  Deneb()
  // here
    .myRow()
      .bundle([
        Deneb()
          .container(
            height: 200,
            width: 200,
            color: Colors.blue
          )
          .center()
          // and here
          .myWidget(color: Colors.green)
          .text('some text')
        .build(),
        Deneb()
          .container(
            width: 20,
            height: 20,
            color: Colors.red,
          )
        .build(),
      ])
  .build()
```

though the built in part is not completed, you can add other widgets by your self😊