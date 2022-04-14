import 'package:flutter/material.dart';

class ColorTweenExample extends StatefulWidget {
  const ColorTweenExample({Key? key}) : super(key: key);

  @override
  State<ColorTweenExample> createState() => _ColorTweenExampleState();
}

class _ColorTweenExampleState extends State<ColorTweenExample>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Color?>? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.grey,
      end: Colors.blue,
    ).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Tween Example')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 49, 58, 88),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                controller!.forward().then((value) {
                  controller!.reverse();
                });
              },
              child: Text('Renk Değiştir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.5,
              color: animation!.value,
            )
          ],
        ),
      ),
    );
  }
}
