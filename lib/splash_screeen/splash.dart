import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    toScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Text(
          'SplashScreen',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }

  Future<void> toScreen() async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLogin') ?? false) {
      Navigator.of(context).pushNamed('/welcome');
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }
}
