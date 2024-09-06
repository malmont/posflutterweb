
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pos_flutter/features/home/providers.dart';

import '../../../../../design/design.dart';

class HideMenu extends ConsumerWidget {
  const HideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCollapsed = ref.watch(isSideMenuCollapsed);
    return GestureDetector(
      onTap: () {
        ref.read(isSideMenuCollapsed.notifier).state = !isCollapsed;
      },
      child: Container(
          height: Units.sizedbox_50 ,
          width:Units.sizedbox_20,
          decoration: const BoxDecoration(
            color: Colours.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Units.radiusXXLarge),
              bottomLeft: Radius.circular(Units.radiusXXLarge),
            ),
            boxShadow: [
              BoxShadow(
                color: Colours.shadowHideMenu,
                spreadRadius: Units.radiusSmall,
                blurRadius: Units.radiusXLarge,
                offset: Offset(-5, 0),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: Units.durationXLarge),
            firstChild: const Icon(
              Icons.arrow_forward_ios,
                size: Units.iconSmall,
            ),
            secondChild: const Icon(
              Icons.arrow_back_ios_new,
              size: Units.iconSmall,
            ),
            crossFadeState: isCollapsed
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          )),
    );
  }
}
