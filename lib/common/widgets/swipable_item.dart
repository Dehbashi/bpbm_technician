import 'package:flutter/material.dart';

class SwipeableItem extends StatelessWidget {
  const SwipeableItem({
    Key? key,
    required this.child,
    required this.isSwiping,
    required this.onSwipingChanged,
    required this.onSwipingEnd,
  }) : super(key: key);

  final Widget child;
  final bool isSwiping;
  final ValueChanged<bool> onSwipingChanged;
  final Function() onSwipingEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (_) {
        onSwipingChanged(true);
      },
      onHorizontalDragEnd: (_) {
        onSwipingChanged(false);
        onSwipingEnd();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(
          isSwiping ? -50 : 0,
          0,
          0,
        ),
        child: child,
      ),
    );
  }
}
