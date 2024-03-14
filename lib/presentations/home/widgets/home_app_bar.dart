import 'package:ezy_sneakers/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    this.onMenuButton,
    this.onNotificationButton,
    this.onCartButton,
  });
  final VoidCallback? onMenuButton;
  final VoidCallback? onNotificationButton;
  final VoidCallback? onCartButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: kLightGrey.withOpacity(0.2),
      leading: IconButton(
        onPressed: onMenuButton,
        icon: const Icon(
          Iconsax.menu_1,
          size: 28,
          color: kIconsColor,
        ),
      ),
      title: Text(
        "Home",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      actions: [
        buildActionIcons(
          icon: Iconsax.notification,
          isNotificationIcon: true,
          onTap: onNotificationButton,
        ),
        buildActionIcons(
          icon: Iconsax.bag_2,
          isNotificationIcon: true,
          onTap: onCartButton,
        ),
      ],
    );
  }

  Widget buildActionIcons({
    required IconData icon,
    required bool isNotificationIcon,
    VoidCallback? onTap,
  }) {
    return Stack(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: 26,
            color: kIconsColor,
          ),
        ),
        if (isNotificationIcon)
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.brightness_1,
              color: kAlertColor,
              size: 5,
            ),
          ),
      ],
    );
  }
}
