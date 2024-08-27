import 'package:flutter/material.dart';
import 'package:pos_flutter/features/authentification/application/viewmodels/signin_viewmodel.dart';
import 'package:pos_flutter/features/home/presentation/pages/MainViewPage.dart';
import 'package:provider/provider.dart';

class SignInViewPage extends StatelessWidget {
  const SignInViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393C49), // Couleur de fond
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500), // Largeur maximale plus réduite pour le bureau
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Consumer<SignInViewModel>(
              builder: (context, viewModel, child) {
                 if (viewModel.user != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainViewPage(),
                      ),
                    );
                  });
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo ou nom de l'entreprise
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: [
                          // Remplacez cette image par le logo de votre entreprise
                          Image.asset(
                            'assets/logo.png', // Placez l'image du logo ici
                            width: 320,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Nom de l\'entreprise',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Couleur du texte du nom de l'entreprise
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (viewModel.isLoading)
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA7C69)),
                      ),
                    if (!viewModel.isLoading) ...[
                      TextField(
                        style: const TextStyle(color: Colors.white), // Texte en blanc
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFEA7C69)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: viewModel.setEmail,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        style: const TextStyle(color: Colors.white), // Texte en blanc
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFEA7C69)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        obscureText: true,
                        onChanged: viewModel.setPassword,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          await viewModel.signIn();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEA7C69), // Couleur du bouton
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Bouton moins arrondi
                          ),
                          minimumSize: const Size(double.infinity, 50), // Bouton plus large
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                    if (viewModel.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          viewModel.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
