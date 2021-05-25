import 'package:calisthenics/routes.dart';
import 'package:calisthenics/screens/home/home_screen.dart';
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
      child: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MaterialApp(
        title: 'App',
        debugShowCheckedModeBanner: true,
        theme: theme(),
        initialRoute: HomeScreen.routeName,
        routes: routes,
      );
    } else {
      return MaterialApp(
        title: 'App',
        debugShowCheckedModeBanner: true,
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      );
    }
  }
}
