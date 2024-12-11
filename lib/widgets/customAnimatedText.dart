import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  AnimatedText({
    required this.text,
    required this.style,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.text.length,
          (index) => AnimationController(
        vsync: this,
        duration: widget.duration,
      ),
    );
    _startAnimations();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _startAnimations() {
    for (int i = 0; i < widget.text.length; i++) {
      Future.delayed(widget.duration * i, () {
        if (mounted) {
          _controllers[i].forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.text.length,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: AnimatedBuilder(
            animation: _controllers[index],
            builder: (context, child) {
              return Opacity(
                opacity: _controllers[index].value,
                child: Text(
                  widget.text[index],
                  style: widget.style,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
