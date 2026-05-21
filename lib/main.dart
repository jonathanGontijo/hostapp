import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hostapp/pages/auth/login_page.dart';
import 'package:hostapp/pages/auth/signup_page.dart';
import 'package:hostapp/pages/guest/guest_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hostel Management System",
      theme: ThemeData(
        fontFamily: 'Couture',
        brightness: Brightness.dark,
      ).copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Couture',
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.black,
            primaryColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 0,
              titleTextStyle: TextStyle(
                fontFamily: 'Couture',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            colorScheme: const ColorScheme.dark(
              primary: Colors.black,
              secondary: Colors.white,
              background: Colors.black,
              surface: Colors.black,
              onPrimary: Colors.white,
              onSecondary: Colors.black,
              onBackground: Colors.white,
              onSurface: Colors.white,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white12,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.white70),
              hintStyle: TextStyle(color: Colors.white54),

      ),),
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        SignupPage.routeName: (context) => const SignupPage(),
        GuestHomePage.routeName: (context) => const GuestHomePage(),
      },
    );
  }
}

