import 'package:flutter/material.dart';
import 'package:test_app/login_screen/login_screen.dart';
import 'package:test_app/splash_screeen/splash.dart';
import 'package:test_app/welcome_screen/welcome_screen.dart';

void main() {
  runApp(VncApp());
}

class VncApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
