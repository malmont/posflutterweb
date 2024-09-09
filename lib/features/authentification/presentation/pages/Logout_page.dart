import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/features/authentification/application/blocs/auth_bloc.dart';

import '../../../../design/design.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de Déconnexion'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutEvent());
              },
              child: const Text(
                "Disconnect",
                style: TextStyles.interItalicTiny,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutEvent());
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 24),
              ),
              child: const Text('Déconnexion'),
            ),
          ),
        ],
      ),
    );
  }
}
