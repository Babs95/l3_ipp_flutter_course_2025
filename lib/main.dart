import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:l3_ipp_app/common/constants_assets.dart';
import 'package:l3_ipp_app/state_managment/provider/authentification_service.dart';
import 'package:l3_ipp_app/views/home.dart';
import 'package:l3_ipp_app/views/splash_screen.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';

void main() async {
  //S'assure que les liaisons Flutter sont initatialisés avant d'éxécuter
  // d'autres operations asynchrones.
  //C'est nécessaire lorsqu'on doit effectuer des tâches asynchrones
  // avant le lancement de l'app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthentificationService()),
      StreamProvider<User?>.value(value: AuthentificationService().authStateChanges, initialData: null,)
    ],
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "IPP L3 GL",
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}
