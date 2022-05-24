import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({Key? key}) : super(key: key);

  @override
  State<RotationTransitionExample> createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      lowerBound: 0.0,
      upperBound: 0.3,
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Transition Example'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedContainer(
                  width: 50.0,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 27, 34, 64),
                        Color.fromARGB(255, 58, 66, 99),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: RotationTransition(
                    turns: _animation,
                    child: Transform.rotate(
                      angle: 0,
                      child: const Icon(Icons.lock,
                          color: Colors.white, size: 24.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
