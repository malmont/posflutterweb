import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pos_flutter/features/home/application/blocs/side_menu_bloc.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/core/router/app_router.dart';
import 'package:pos_flutter/di/injection_container.dart';
import 'package:pos_flutter/features/authentification/application/blocs/auth_bloc.dart';
import 'package:pos_flutter/features/authentification/application/viewmodels/signin_viewmodel.dart';
import 'package:pos_flutter/features/authentification/presentation/pages/sign_in_view_page.dart';
import 'package:pos_flutter/features/home/presentation/pages/MainViewPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const envFile =
      String.fromEnvironment('ENV_FILE', defaultValue: ".env.local");
  await dotenv.load(fileName: envFile);

  await configureDependencies();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              getIt<AuthBloc>()..add(CheckAuthenticationEvent()),
        ),
        provider.ChangeNotifierProvider<SignInViewModel>(
          create: (context) => SignInViewModel(getIt<AuthBloc>()),
        ),
        BlocProvider<SideMenuBloc>(
          create: (context) => SideMenuBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'POS Flutter',
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const AuthWrapper(),
        builder: EasyLoading.init(),
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
        } else if (state is Unauthenticated ||
            state is AuthFailure ||
            state is AuthLoggedOut) {
          EasyLoading.dismiss();
          return const SignInViewPage();
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
