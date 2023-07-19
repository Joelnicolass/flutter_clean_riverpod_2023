import 'package:flutter/material.dart';
import 'package:socialgeneric/common/widgets/avatarGeneric/avatar_generic.dart';

class AvatarCarousel extends StatelessWidget {
  const AvatarCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return AvatarGeneric(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
