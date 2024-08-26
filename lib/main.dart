import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/core/router/app_router.dart';
import 'package:pos_flutter/features/authentification/presentation/pages/sign_in_view-page.dart';
import 'package:pos_flutter/features/home/presentation/pages/MainViewPage.dart';
import 'package:provider/provider.dart';
import 'package:pos_flutter/di/injection_container.dart';
import 'package:pos_flutter/features/authentification/application/blocs/auth_bloc.dart';
import 'package:pos_flutter/features/authentification/application/viewmodels/signin_viewmodel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(CheckAuthenticationEvent()),  
        ),
        ChangeNotifierProvider(
          create: (context) => sl<SignInViewModel>(),  
        ),
      ],
      child: const MaterialApp(
        title: 'POS Flutter',
        onGenerateRoute: AppRouter.onGenerateRoute, 
        home: AuthWrapper(),  
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const MainViewPage();  
        } else if (state is Unauthenticated || state is AuthFailure) {
          return const SignInViewPage(); 
        } else {
          return const Scaffold(body: Center(child: CircularProgressIndicator())); 
        }
      },
    );
  }
}
