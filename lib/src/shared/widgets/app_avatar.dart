import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_cite/src/core/theme/dimens.dart';
import 'package:smart_cite/src/shared/enum/avatar_style.dart';

class AppAvatar extends StatelessWidget {
  final AvatarStyle avatarStyle;
  const AppAvatar({super.key, required this.avatarStyle});

  @override
  Widget build(BuildContext context) {
    return Badge(
      offset: const Offset(-2, -2),
      alignment: AlignmentDirectional.bottomEnd,
      isLabelVisible: avatarStyle == AvatarStyle.profile
          ? true : false,
      largeSize: 8,
      label: avatarStyle == AvatarStyle.profile
          ? Container(
              height: 8,
              width: 8,
              color: Theme.of(context).colorScheme.primary,
              child: const Icon(
                Iconsax.edit_2,
                color: Colors.white,
              ),
            )
          : const SizedBox.shrink(),
      child: avatarStyle == AvatarStyle.profile
          ? Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.halfRadius),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/profile_avatar.jpg'),
                      fit: BoxFit.fill)),
            )
          : const CircleAvatar(
              foregroundImage: AssetImage('assets/images/home_avatar.jpg'),
            ),
    );
  }
}
