import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  @override
  _LottiePageState createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<String> _animationAssets = [
    'assets/animation/Animation1.json',
    'assets/animation/Animation2.json',
    'assets/animation/Animation3.json',
    'assets/animation/Animation4.json',
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextAnimation() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _animationAssets.length;
      _controller.forward(from: 0.0);
    });
  }

  void _previousAnimation() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _animationAssets.length;
      _controller.reverse(from: 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Lottie.asset(
                _animationAssets[_currentIndex],
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: _previousAnimation,
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.black,
                  onPressed: _nextAnimation,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
