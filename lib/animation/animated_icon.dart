import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  final Icon firstIcon;
  final Icon secondIcon;
  const AnimatedIconWidget({
    Key? key,
    required this.firstIcon,
    required this.secondIcon,
  }) : super(key: key);

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  bool isPlay = false;
  late AnimationController _controller;
  late Animation _animation;
  Icon? presentIcon;
  @override
  void initState() {
    _animation = Tween(begin: 0.0, end: pi / 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animation.status == AnimationStatus.completed) {
          _controller.reverse();
          presentIcon = widget.firstIcon;
        } else if (_animation.status == AnimationStatus.dismissed) {
          _controller.forward();
          presentIcon = widget.secondIcon;
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: presentIcon,
          );
        },
      ),
    );
  }
}
