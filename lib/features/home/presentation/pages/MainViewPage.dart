import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pos_flutter/features/dashboard/presentation/pages/dashboard_view_page.dart';
import 'package:pos_flutter/features/home/presentation/widgets/sideMenu/animated_wave.dart';
import 'package:pos_flutter/features/home/providers.dart';
import 'package:pos_flutter/features/home/side_menu/side_menu.dart';
import 'package:pos_flutter/features/products/presentation/pages/product_view_page.dart';
import 'package:pos_flutter/features/seeting/presentation/pages/seeting_view_page.dart';


final List<Widget> pages = [
  const ProductViewPage(),
  const DashboardViewPage(),
  const SeatingViewPage(),

];
class MainViewPage extends HookConsumerWidget {
  const MainViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    final selectedMenu = ref.watch(selectedMenuProvider); // Surveille la sélection du menu

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Menu latéral
          Expanded(
            flex: 2, // Ajuste ce ratio selon tes besoins
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
                      child: const SideMenu(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
         
          Expanded(
            flex: 10,
            child: pages[selectedMenu], 
          ),
        ],
      ),
    );
  }
}
