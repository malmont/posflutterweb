
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pos_flutter/features/home/providers.dart';
import 'package:pos_flutter/design/assets_images_and_icones.dart';

import '../../../../../design/design.dart';
import 'margin.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCollapsed = ref.watch(isSideMenuCollapsed);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: Units.radiusXXXXXXXXLarge,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: Units.radiusXXXXXXXLarge,
              backgroundImage: AssetImage(AppAssets.logo),
            ),
          ),
          if (!isCollapsed) const RowSpacing(Units.sizedbox_16),
          if (!isCollapsed)
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                ],
              ),
            ),
        ],
      ),
    );
  }
}
