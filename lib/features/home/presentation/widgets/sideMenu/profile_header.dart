
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/features/home/application/blocs/side_menu_bloc.dart';

import '../../../../../design/design.dart';



class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideMenuBloc, SideMenuState>(
      builder: (context, state) {
        return Row(
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
            
          ],
        );
      },
    );
  }
}
