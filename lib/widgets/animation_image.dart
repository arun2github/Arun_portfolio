
import 'package:flutter/material.dart';
class ImageAnimation extends StatefulWidget {
  const ImageAnimation({super.key});

  @override
  State<ImageAnimation> createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0.2, 0.2),
    end: Offset(0.2, 0.2),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/profile_pic.png',
          height: 300,
          width: 200,
        ),
      ),
    );
  }
}
