import 'package:calisthenics/routes.dart';
import 'package:calisthenics/screens/complete_profile/complete_profile_screen.dart';
import 'package:calisthenics/screens/splash/splash_screen.dart';
import 'package:calisthenics/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:calisthenics/Controllers/AuthenticationService.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //Autenticação
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          //Caso ele não tenha criado conta
          create: (_) => AuthenticationService(),
        ),
        StreamProvider(
          //Caso ele esteja logado
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        title: 'App',
        debugShowCheckedModeBanner: true,
        theme: theme(),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MaterialApp(
        initialRoute: CompleteProfileScreen.routeName,
        routes: routes,
      );
    } else {
      return MaterialApp(
        initialRoute: SplashScreen.routeName,
        routes: routes,
      );
    }
  }
}
