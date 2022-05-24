import 'package:animation_series/animated_icon/animated_icon_example.dart';
import 'package:animation_series/color_tween/color_tween_example.dart';
import 'package:animation_series/rotation_transition/rotation_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AnimatedIconExample();
                }));
              },
              child: Text('Animated Icon'),
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ColorTweenExample();
                }));
              },
              child: Text('Color Tween'),
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RotationTransitionExample();
                }));
              },
              child: Text('Rotation Transition'),
            ),
          ),
        ],
      ),
    );
  }
}
