import 'package:flutter/material.dart';

/// Drop-in replacement for GestureDetector that also shows the hand cursor
/// on desktop and web whenever the widget is tappable
class Tappable extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const Tappable({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}
