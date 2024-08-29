
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/create_new_task.dart';

import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/hide_menu.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/margin.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/menu_header.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/menu_tile.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/menu_tile_trailing.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/profile_header.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/services_menu.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/settings_menu.dart';
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
          color: const Color(0xFF1F1D2B),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // Partie supérieure (en-tête, etc.)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProfileHeader(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Divider(
                    height: 0,
                  ),
                ),
              

                // Liste des éléments du menu qui prend tout l'espace restant
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
              right: 0,
              top: 40,
              child: HideMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
