
import 'package:flutter/material.dart';
import 'package:pos_flutter/features/authentification/application/viewmodels/signin_viewmodel.dart';
import 'package:provider/provider.dart';


class SignInViewPage extends StatelessWidget {
  const SignInViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<SignInViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                if (viewModel.isLoading) const CircularProgressIndicator(),
                if (!viewModel.isLoading) ...[
                  TextField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    onChanged: viewModel.setEmail,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onChanged: viewModel.setPassword,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.signIn();
                    },
                    child: const Text('Sign In'),
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
                if (viewModel.user != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Welcome, ${viewModel.user!.firstName} ${viewModel.user!.lastName}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
