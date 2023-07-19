import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class AvatarGeneric extends StatelessWidget {
  const AvatarGeneric(
      {super.key, required this.index, this.size = 60, this.border = true});

  final double size;
  final int index;
  final bool border;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AdvancedAvatar(
      size: size,
      margin: EdgeInsets.all(10),
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: theme.primary.withGreen(index * 20),
          width: border ? 2 : 0,
        ),
        shape: BoxShape.circle,
      ),
      image: NetworkImage('https://i.pravatar.cc/300?img=$index'),
    );
  }
}
