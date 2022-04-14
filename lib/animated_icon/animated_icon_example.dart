import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({Key? key}) : super(key: key);

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {
  bool isClicked = false;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Icon Example'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isClicked = !isClicked;
                  if (isClicked) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
              icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController),
            ),
          ],
        ),
      ),
    );
  }
}
