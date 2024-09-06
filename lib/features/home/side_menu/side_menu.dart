
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/hide_menu.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/menu_tile.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/profile_header.dart';
import 'package:pos_flutter/design/design.dart';
import 'package:pos_flutter/features/home/providers.dart';
import 'package:pos_flutter/features/home/src/constants.dart';
class SideMenu extends ConsumerWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      onExit: (_) {
        Future.delayed(const Duration(milliseconds: 200),
            () => ref.read(isSideMenuCollapsed.notifier).state = true);
      },
      child: Container(
        decoration: BoxDecoration(
          color:  Colours.primaryPalette,
          borderRadius: BorderRadius.circular(Units.radiusXXXXXXLarge),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // Partie supérieure (en-tête, etc.)
                const Padding(
                  padding: EdgeInsets.all(Units.edgeInsetsLarge),
                  child: ProfileHeader(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Units.edgeInsetsXXLarge),
                  child: Divider(
                    height: 0,
                  ),
                ),
              

                // Liste des éléments du menu qui prend tout l'espace restant
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: Units.edgeInsetsXXLarge, horizontal: Units.edgeInsetsXXXLarge),
                    children: [
                      ...menuItems.map(
                        (e) => MenuTile(
                          menu: e,
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Bouton pour cacher le menu
            const Positioned(
              right: Units.position,
              top: Units.positionXXXLarge,
              child: HideMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
