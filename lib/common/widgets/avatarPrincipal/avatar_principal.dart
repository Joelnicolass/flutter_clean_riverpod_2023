import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class AvatarPrincipal extends StatelessWidget {
  const AvatarPrincipal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AdvancedAvatar(
      size: 80,
      margin: EdgeInsets.all(10),
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: theme.primary,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      image: NetworkImage('https://i.pravatar.cc/300'),
    );
  }
}
