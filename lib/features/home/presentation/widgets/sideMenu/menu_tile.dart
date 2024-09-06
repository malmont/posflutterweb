import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pos_flutter/features/home/infrastucture/models/menu_item.dart';
import 'package:pos_flutter/features/home/providers.dart';

import '../../../../../design/design.dart';

class MenuTile extends ConsumerWidget {
  final MenuItemModel menu;
  final Widget? trailing;

  const MenuTile({super.key, required this.menu, this.trailing});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.watch(selectedMenuProvider);
    bool isCollapsed = ref.watch(isSideMenuCollapsed);

    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.only(top:  Units.edgeInsetsLarge, bottom:  Units.edgeInsetsLarge),
        selected: menu.index == selectedMenu,
        onTap: () {
          ref.read(selectedMenuProvider.notifier).state = menu.index;
        },
        selectedTileColor: Colours.colorsButtonMenu,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Units.radiusXXXXXLarge),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: isCollapsed ? Units.edgeInsetsXXXLarge : Units.edgeInsetsLarge),
          child: SvgPicture.asset(
            menu.icon,
            color: menu.index == selectedMenu
                ? Colours.white
                : Colours.colorsButtonMenu,
          ),
        ),
        title: isCollapsed
            ? null
            : Text(
                menu.title,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                style: TextStyles.interRegularTiny
              ),
        trailing: isCollapsed
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: Units.edgeInsetsMedium),
                child: trailing,
              ),
      ),
    );
  }
}
