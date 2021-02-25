import 'package:flutter/material.dart';
import 'package:test_app/login_screen/form_login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'LOGO VS SLOGAN',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                FormLogin(),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Bỏ qua và trải nghiệm ngay?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Image.asset(
                  'assets/images/login_pic.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
