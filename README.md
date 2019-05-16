# Circular Reveal Animation

Circular Reveal Animation as Flutter widget!

Inspired by Android's `ViewAnimationUtils.createCircularReveal(...)`.

## Demo

![](https://github.com/qwert2603/circular_reveal_animation/blob/master/art/device20190516131715%20(1).gif)

## Usage

```dart
CircularRevealAnimation(
  // @required
  child: Container(color: Colors.red),
  // @required [Animation<double>]
  animation: animation,
  // child's center if not specified
  center: Offset(0, 300),
  // 0 if not specified
  minRadius: 12,
  // distance from center to further child's corner if not specified
  maxRadius: 200,
);
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRA Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRA Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircularRevealAnimation(
          minRadius: 12,
          maxRadius: 200,
          center: Offset(0, 300),
          child: Container(color: Colors.red),
          animation: animation,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (animationController.status == AnimationStatus.forward ||
            animationController.status == AnimationStatus.completed) {
          animationController.reverse();
        } else {
          animationController.forward();
        }
      }),
    );
  }
}

```
