import 'package:pos_flutter/features/authentification/application/blocs/auth_bloc.dart';
import 'package:pos_flutter/features/authentification/presentation/pages/sign_in_view-page.dart';
import 'package:pos_flutter/features/home/application/blocs/side_menu_bloc.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/hide_menu.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/menu_tile.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/profile_header.dart';
import 'package:pos_flutter/features/home/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          // Redirection vers la page de connexion après déconnexion
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignInViewPage()),
          );
        }
      },
      child: BlocBuilder<SideMenuBloc, SideMenuState>(
        builder: (context, state) {
          bool isCollapsed = state.isCollapsed;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Durée de l'animation
            width: isCollapsed ? 128 : 280, // Largeur du menu selon son état
            decoration: BoxDecoration(
              color: Colours.primaryPalette,
              borderRadius: BorderRadius.circular(Units.radiusXXXXXXLarge),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(Units.edgeInsetsLarge),
                      child: ProfileHeader(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: Units.edgeInsetsXXLarge),
                      child: Divider(height: 0),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          vertical: Units.edgeInsetsXXLarge,
                          horizontal: Units.edgeInsetsXXXLarge,
                        ),
                        children: menuItems
                            .map(
                              (e) => MenuTile(menu: e),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(SignOutEvent()); // Déclenche la déconnexion
                        },
                        child: const Text(
                          "Disconnect",
                          style: TextStyles.interItalicTiny,
                        ),
                      ),
                    ),
                  ],
                ),
                const Positioned(
                  right: Units.position,
                  top: Units.positionXXXLarge,
                  child: HideMenu(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
