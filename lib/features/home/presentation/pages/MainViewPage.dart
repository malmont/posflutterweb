import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/features/dashboard/presentation/pages/dashboard_view_page.dart';
import 'package:pos_flutter/features/home/application/blocs/side_menu_bloc.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/animated_wave.dart';
import 'package:pos_flutter/features/home/side_menu/side_menu.dart';
import 'package:pos_flutter/features/products/presentation/pages/product_view_page.dart';
import 'package:pos_flutter/features/seeting/presentation/pages/seeting_view_page.dart';

final List<Widget> pages = [
  const ProductViewPage(),
  const DashboardViewPage(),
  const SeatingViewPage(),
];

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<SideMenuBloc, SideMenuState>(
      builder: (context, state) {
        bool isCollapsed = state.isCollapsed; // Récupérer l'état de réduction du menu
        final int selectedMenu = state.selectedMenuIndex; // Récupérer l'index du menu sélectionné

        return Scaffold(
          backgroundColor: Colors.white,
          body: Row(
            children: [
              // Menu latéral
              Expanded(
                flex: 2, // Ajuster ce ratio selon vos besoins
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      const AnimatedWave(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: isCollapsed ? 128 : 280,
                          decoration: BoxDecoration(
                            color: colorScheme.background,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFF1F1D2B),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const SideMenu(), // Le menu reste inchangé
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Page de contenu correspondant au menu sélectionné
              Expanded(
                flex: 10,
                child: pages[selectedMenu], // Afficher la page sélectionnée
              ),
            ],
          ),
        );
      },
    );
  }
}
