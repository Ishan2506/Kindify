import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final double width;
  final double height;
  final Duration duration;
  final Duration interval; // ⏱ auto flip interval
  final bool autoFlip;

  const FlipCard({
    super.key,
    required this.front,
    required this.back,
    this.width = 200,
    this.height = 200,
    this.duration = const Duration(milliseconds: 400),
    this.interval = const Duration(seconds: 3),
    this.autoFlip = true,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late Timer? _timer;
  bool _showFront = true;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration);

    // start auto-flip timer if enabled
    if (widget.autoFlip) {
      _timer = Timer.periodic(widget.interval, (_) => _toggle());
    }
  }

  void _toggle() {
    if (_ctrl.isAnimating) return;
    _showFront ? _ctrl.forward() : _ctrl.reverse();
    setState(() => _showFront = !_showFront);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, child) {
          final angle = _ctrl.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);

          final isFront = angle < pi / 2;
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Transform(
              transform: transform,
              alignment: Alignment.center,
              child: isFront
                  ? widget.front
                  : Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(pi),
                child: widget.back,
              ),
            ),
          );
        },
      ),
    );
  }
}
